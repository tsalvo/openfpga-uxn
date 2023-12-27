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
-- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_d649]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal t16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1025_c2_eac9]
signal n16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_32da]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1038_c7_c460]
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_c460]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_c460]
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_c460]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_c460]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_c460]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1038_c7_c460]
signal t16_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1038_c7_c460]
signal n16_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_f9e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1041_c7_af45]
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_af45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_af45]
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_af45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_af45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_af45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1041_c7_af45]
signal t16_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1041_c7_af45]
signal n16_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_5804]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1046_c7_f272]
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_f272]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_f272]
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_f272]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_f272]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_f272]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1046_c7_f272]
signal t16_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1046_c7_f272]
signal n16_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1047_c3_ac8f]
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_1ba9]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1050_c7_95a2]
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_95a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_95a2]
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_95a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_95a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_95a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1050_c7_95a2]
signal n16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_2b85]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1054_c7_6b03]
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_6b03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_6b03]
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_6b03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_6b03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_6b03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1054_c7_6b03]
signal n16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1055_c3_e30f]
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1056_c11_8540]
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1057_c30_3fcc]
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_e635]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_a5c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_a5c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_a5c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_a5c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1065_c31_675a]
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9
tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- t16_MUX_uxn_opcodes_h_l1025_c2_eac9
t16_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
t16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- n16_MUX_uxn_opcodes_h_l1025_c2_eac9
n16_MUX_uxn_opcodes_h_l1025_c2_eac9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond,
n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue,
n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse,
n16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1038_c7_c460
tmp16_MUX_uxn_opcodes_h_l1038_c7_c460 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_cond,
tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue,
tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse,
tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_cond,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_return_output);

-- t16_MUX_uxn_opcodes_h_l1038_c7_c460
t16_MUX_uxn_opcodes_h_l1038_c7_c460 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1038_c7_c460_cond,
t16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue,
t16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse,
t16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output);

-- n16_MUX_uxn_opcodes_h_l1038_c7_c460
n16_MUX_uxn_opcodes_h_l1038_c7_c460 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1038_c7_c460_cond,
n16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue,
n16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse,
n16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1041_c7_af45
tmp16_MUX_uxn_opcodes_h_l1041_c7_af45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_cond,
tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue,
tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse,
tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_cond,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_return_output);

-- t16_MUX_uxn_opcodes_h_l1041_c7_af45
t16_MUX_uxn_opcodes_h_l1041_c7_af45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1041_c7_af45_cond,
t16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue,
t16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse,
t16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output);

-- n16_MUX_uxn_opcodes_h_l1041_c7_af45
n16_MUX_uxn_opcodes_h_l1041_c7_af45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1041_c7_af45_cond,
n16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue,
n16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse,
n16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1046_c7_f272
tmp16_MUX_uxn_opcodes_h_l1046_c7_f272 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_cond,
tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue,
tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse,
tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_cond,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_return_output);

-- t16_MUX_uxn_opcodes_h_l1046_c7_f272
t16_MUX_uxn_opcodes_h_l1046_c7_f272 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1046_c7_f272_cond,
t16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue,
t16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse,
t16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output);

-- n16_MUX_uxn_opcodes_h_l1046_c7_f272
n16_MUX_uxn_opcodes_h_l1046_c7_f272 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1046_c7_f272_cond,
n16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue,
n16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse,
n16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f
BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_left,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_right,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2
tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond,
tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output);

-- n16_MUX_uxn_opcodes_h_l1050_c7_95a2
n16_MUX_uxn_opcodes_h_l1050_c7_95a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond,
n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue,
n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse,
n16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03
tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond,
tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue,
tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse,
tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_cond,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output);

-- n16_MUX_uxn_opcodes_h_l1054_c7_6b03
n16_MUX_uxn_opcodes_h_l1054_c7_6b03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond,
n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue,
n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse,
n16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f
BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_left,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_right,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540
BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_left,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_right,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc
sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_ins,
sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_x,
sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_y,
sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1065_c31_675a
CONST_SR_8_uxn_opcodes_h_l1065_c31_675a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_x,
CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output,
 tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 t16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 n16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output,
 tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_return_output,
 t16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output,
 n16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_return_output,
 t16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output,
 n16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output,
 tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_return_output,
 t16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output,
 n16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output,
 n16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output,
 tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output,
 n16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_return_output,
 sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output,
 CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_d09d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_2261 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_f988 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_7435 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_e0ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_3bf3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_9656_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_26e1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_a3c1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_0ea6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_21c5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_486e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_ea42_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_c2d9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_f588_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_4e85_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1021_l1069_DUPLICATE_a16f_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_2261 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_2261;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_7435 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_7435;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_3bf3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_3bf3;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_a3c1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_a3c1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_f988 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_f988;
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_26e1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_26e1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_d09d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_d09d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_e0ff := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_e0ff;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_5804] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_4e85 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_4e85_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_e635] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_d649] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output := result.is_vram_write;

     -- CONST_SR_8[uxn_opcodes_h_l1065_c31_675a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_return_output := CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_f588 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_f588_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_c2d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_c2d9_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1057_c30_3fcc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_ins;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_x;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_return_output := sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_2b85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_f9e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_1ba9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_ea42 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_ea42_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_32da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_21c5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_21c5_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_486e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_486e_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_d649_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_32da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f9e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_5804_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_1ba9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2b85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e635_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_f588_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_f588_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_f588_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_ea42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_ea42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_ea42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_ea42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_ea42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_c2d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_c2d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_c2d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_c2d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_c2d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_c2d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_486e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_486e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_486e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_486e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_486e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_4e85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_4e85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_21c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_21c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_21c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_21c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_21c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_21c5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_eac9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_3fcc_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_a5c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1055_c3_e30f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_left;
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_return_output := BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_6b03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_a5c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_a5c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1065_c21_0ea6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_0ea6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_675a_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1047_c3_ac8f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_left;
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_return_output := BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_ac8f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_e30f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_0ea6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_e02c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_6b03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_6b03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1056_c11_8540] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_left;
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_return_output := BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_95a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1054_c7_6b03] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond;
     n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue;
     n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output := n16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_6b03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_a5c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1046_c7_f272] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1046_c7_f272_cond <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_cond;
     t16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue;
     t16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output := t16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_a5c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_95a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1041_c7_af45] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1041_c7_af45_cond <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_cond;
     t16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue;
     t16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output := t16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;

     -- n16_MUX[uxn_opcodes_h_l1050_c7_95a2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond;
     n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue;
     n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output := n16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1054_c7_6b03] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_cond;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output := tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_95a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_95a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1060_c21_9656] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_9656_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_8540_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_f272] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_9656_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_af45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_f272] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_f272] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1050_c7_95a2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_cond;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output := tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_6b03] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output := result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;

     -- n16_MUX[uxn_opcodes_h_l1046_c7_f272] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1046_c7_f272_cond <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_cond;
     n16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue;
     n16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output := n16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_f272] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;

     -- t16_MUX[uxn_opcodes_h_l1038_c7_c460] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1038_c7_c460_cond <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_cond;
     t16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue;
     t16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output := t16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_6b03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;
     -- t16_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := t16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_c460] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1046_c7_f272] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_cond;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output := tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_af45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_95a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_af45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;

     -- n16_MUX[uxn_opcodes_h_l1041_c7_af45] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1041_c7_af45_cond <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_cond;
     n16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue;
     n16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output := n16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_af45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_95a2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_f272] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_return_output := result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;

     -- n16_MUX[uxn_opcodes_h_l1038_c7_c460] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1038_c7_c460_cond <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_cond;
     n16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue;
     n16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output := n16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1041_c7_af45] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_cond;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output := tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_c460] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_c460] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_c460] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_f272_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := n16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1038_c7_c460] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_cond;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output := tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_af45] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_return_output := result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_af45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_c460] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_return_output := result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_c460_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_eac9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1021_l1069_DUPLICATE_a16f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1021_l1069_DUPLICATE_a16f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_eac9_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1021_l1069_DUPLICATE_a16f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1021_l1069_DUPLICATE_a16f_return_output;
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
