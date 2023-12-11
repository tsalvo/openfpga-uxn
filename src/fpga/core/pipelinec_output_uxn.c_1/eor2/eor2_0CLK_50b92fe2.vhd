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
-- BIN_OP_EQ[uxn_opcodes_h_l1134_c6_fe97]
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1134_c2_2033]
signal tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1134_c2_2033]
signal t16_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1134_c2_2033]
signal n16_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1134_c2_2033]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1134_c2_2033]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1134_c2_2033]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1134_c2_2033]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1134_c2_2033]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1134_c2_2033]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1134_c2_2033]
signal result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1134_c2_2033]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1134_c2_2033]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1147_c11_b26b]
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1147_c7_f265]
signal tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1147_c7_f265]
signal t16_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1147_c7_f265]
signal n16_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c7_f265]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1147_c7_f265]
signal result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c7_f265]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c7_f265]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c7_f265]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1150_c11_8f56]
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1150_c7_f046]
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1150_c7_f046]
signal t16_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1150_c7_f046]
signal n16_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1150_c7_f046]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1150_c7_f046]
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1150_c7_f046]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1150_c7_f046]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1150_c7_f046]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1155_c11_ad5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1155_c7_761e]
signal tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1155_c7_761e]
signal t16_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1155_c7_761e]
signal n16_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1155_c7_761e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1155_c7_761e]
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1155_c7_761e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1155_c7_761e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1155_c7_761e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1156_c3_83b0]
signal BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_f6d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1159_c7_e5a8]
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1159_c7_e5a8]
signal n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_e5a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_e5a8]
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_e5a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_e5a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_e5a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_add7]
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1163_c7_88b1]
signal tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1163_c7_88b1]
signal n16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_88b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_88b1]
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_88b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_88b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_88b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1164_c3_ece4]
signal BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1165_c11_e776]
signal BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1166_c30_692a]
signal sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1171_c11_6721]
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1171_c7_9f93]
signal result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1171_c7_9f93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1171_c7_9f93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1171_c7_9f93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1174_c31_8139]
signal CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97
BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_left,
BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_right,
BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1134_c2_2033
tmp16_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- t16_MUX_uxn_opcodes_h_l1134_c2_2033
t16_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
t16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
t16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
t16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- n16_MUX_uxn_opcodes_h_l1134_c2_2033
n16_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
n16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
n16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
n16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033
result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033
result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033
result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033
result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033
result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_left,
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_right,
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1147_c7_f265
tmp16_MUX_uxn_opcodes_h_l1147_c7_f265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_cond,
tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue,
tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse,
tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output);

-- t16_MUX_uxn_opcodes_h_l1147_c7_f265
t16_MUX_uxn_opcodes_h_l1147_c7_f265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1147_c7_f265_cond,
t16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue,
t16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse,
t16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output);

-- n16_MUX_uxn_opcodes_h_l1147_c7_f265
n16_MUX_uxn_opcodes_h_l1147_c7_f265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1147_c7_f265_cond,
n16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue,
n16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse,
n16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265
result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_cond,
result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_left,
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_right,
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1150_c7_f046
tmp16_MUX_uxn_opcodes_h_l1150_c7_f046 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_cond,
tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue,
tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse,
tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output);

-- t16_MUX_uxn_opcodes_h_l1150_c7_f046
t16_MUX_uxn_opcodes_h_l1150_c7_f046 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1150_c7_f046_cond,
t16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue,
t16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse,
t16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output);

-- n16_MUX_uxn_opcodes_h_l1150_c7_f046
n16_MUX_uxn_opcodes_h_l1150_c7_f046 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1150_c7_f046_cond,
n16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue,
n16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse,
n16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_cond,
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1155_c7_761e
tmp16_MUX_uxn_opcodes_h_l1155_c7_761e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_cond,
tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output);

-- t16_MUX_uxn_opcodes_h_l1155_c7_761e
t16_MUX_uxn_opcodes_h_l1155_c7_761e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1155_c7_761e_cond,
t16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue,
t16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse,
t16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output);

-- n16_MUX_uxn_opcodes_h_l1155_c7_761e
n16_MUX_uxn_opcodes_h_l1155_c7_761e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1155_c7_761e_cond,
n16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue,
n16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse,
n16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0
BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_left,
BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_right,
BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8
tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond,
tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output);

-- n16_MUX_uxn_opcodes_h_l1159_c7_e5a8
n16_MUX_uxn_opcodes_h_l1159_c7_e5a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond,
n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue,
n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse,
n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_left,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_right,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1
tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond,
tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output);

-- n16_MUX_uxn_opcodes_h_l1163_c7_88b1
n16_MUX_uxn_opcodes_h_l1163_c7_88b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond,
n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue,
n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse,
n16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4
BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_left,
BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_right,
BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776
BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_left,
BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_right,
BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1166_c30_692a
sp_relative_shift_uxn_opcodes_h_l1166_c30_692a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_ins,
sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_x,
sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_y,
sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_left,
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_right,
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93
result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_cond,
result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1174_c31_8139
CONST_SR_8_uxn_opcodes_h_l1174_c31_8139 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_x,
CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28
CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output,
 tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 t16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 n16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output,
 t16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output,
 n16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output,
 tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output,
 t16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output,
 n16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output,
 t16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output,
 n16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output,
 n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output,
 n16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_return_output,
 sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output,
 CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1139_c3_5389 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_ceb5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_a73a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1153_c3_8b34 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_4ddd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_a688 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1169_c21_cf21_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1172_c3_c15a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1173_c3_71e9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1174_c21_8ec1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1134_l1171_l1159_l1155_l1150_l1147_DUPLICATE_ff02_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_27f6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_4b13_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_6bd7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1156_l1164_l1151_l1160_DUPLICATE_eced_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1159_l1171_DUPLICATE_7608_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1178_l1130_DUPLICATE_54d3_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1173_c3_71e9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1173_c3_71e9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_4ddd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_4ddd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_a73a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_a73a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1172_c3_c15a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1172_c3_c15a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_a688 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_a688;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1139_c3_5389 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1139_c3_5389;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1153_c3_8b34 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1153_c3_8b34;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_ceb5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_ceb5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_right := to_unsigned(6, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse := tmp16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1134_c2_2033_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_4b13 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_4b13_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1147_c11_b26b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1156_l1164_l1151_l1160_DUPLICATE_eced LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1156_l1164_l1151_l1160_DUPLICATE_eced_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1150_c11_8f56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_left;
     BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output := BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1166_c30_692a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_ins;
     sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_x;
     sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_return_output := sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_f6d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1134_c2_2033_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1134_c6_fe97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_left;
     BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output := BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1134_c2_2033_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l1174_c31_8139] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_return_output := CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_6bd7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_6bd7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1134_l1171_l1159_l1155_l1150_l1147_DUPLICATE_ff02 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1134_l1171_l1159_l1155_l1150_l1147_DUPLICATE_ff02_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1171_c11_6721] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_left;
     BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_return_output := BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_27f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_27f6_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1134_c2_2033_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1159_l1171_DUPLICATE_7608 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1159_l1171_DUPLICATE_7608_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_add7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1155_c11_ad5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fe97_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_b26b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_8f56_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_ad5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_f6d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_add7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_6721_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1156_l1164_l1151_l1160_DUPLICATE_eced_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1156_l1164_l1151_l1160_DUPLICATE_eced_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1156_l1164_l1151_l1160_DUPLICATE_eced_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_4b13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_4b13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_4b13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_4b13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_4b13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_27f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_27f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_27f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_27f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_27f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_27f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_6bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_6bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_6bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_6bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_6bd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1159_l1171_DUPLICATE_7608_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1159_l1171_DUPLICATE_7608_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1134_l1171_l1159_l1155_l1150_l1147_DUPLICATE_ff02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1134_l1171_l1159_l1155_l1150_l1147_DUPLICATE_ff02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1134_l1171_l1159_l1155_l1150_l1147_DUPLICATE_ff02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1134_l1171_l1159_l1155_l1150_l1147_DUPLICATE_ff02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1134_l1171_l1159_l1155_l1150_l1147_DUPLICATE_ff02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1134_l1171_l1159_l1155_l1150_l1147_DUPLICATE_ff02_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1134_c2_2033_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1134_c2_2033_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1134_c2_2033_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1134_c2_2033_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_692a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_88b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1171_c7_9f93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1174_c21_8ec1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1174_c21_8ec1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_8139_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1156_c3_83b0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_left;
     BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_return_output := BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1164_c3_ece4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_left;
     BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_return_output := BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1171_c7_9f93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1171_c7_9f93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_83b0_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_ece4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1174_c21_8ec1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_1a28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output;
     -- t16_MUX[uxn_opcodes_h_l1155_c7_761e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1155_c7_761e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_cond;
     t16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue;
     t16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output := t16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_88b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1171_c7_9f93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output := result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1165_c11_e776] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_left;
     BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_return_output := BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_88b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_88b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_e5a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1163_c7_88b1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond;
     n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue;
     n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output := n16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_9f93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1159_c7_e5a8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond;
     n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue;
     n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output := n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1150_c7_f046] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1150_c7_f046_cond <= VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_cond;
     t16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue;
     t16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output := t16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1169_c21_cf21] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1169_c21_cf21_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_e776_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1155_c7_761e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_e5a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_e5a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_e5a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1163_c7_88b1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_cond;
     tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output := tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1169_c21_cf21_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1150_c7_f046] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1155_c7_761e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1155_c7_761e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1155_c7_761e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_cond;
     n16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue;
     n16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output := n16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1147_c7_f265] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1147_c7_f265_cond <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_cond;
     t16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue;
     t16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output := t16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_88b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1155_c7_761e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1155_c7_761e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1159_c7_e5a8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond;
     tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output := tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_88b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;
     -- n16_MUX[uxn_opcodes_h_l1150_c7_f046] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1150_c7_f046_cond <= VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_cond;
     n16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue;
     n16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output := n16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_e5a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1150_c7_f046] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1150_c7_f046] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1150_c7_f046] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;

     -- t16_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     t16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     t16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := t16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c7_f265] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1155_c7_761e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_cond;
     tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output := tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_e5a8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c7_f265] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c7_f265] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1150_c7_f046] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_cond;
     tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output := tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;

     -- n16_MUX[uxn_opcodes_h_l1147_c7_f265] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1147_c7_f265_cond <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_cond;
     n16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue;
     n16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output := n16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1155_c7_761e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c7_f265] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_761e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1150_c7_f046] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_return_output := result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1147_c7_f265] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_cond;
     tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output := tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;

     -- n16_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     n16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     n16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := n16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_f046_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1147_c7_f265] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_return_output := result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_f265_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1134_c2_2033] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_return_output := result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1178_l1130_DUPLICATE_54d3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1178_l1130_DUPLICATE_54d3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_2033_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_2033_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1178_l1130_DUPLICATE_54d3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1178_l1130_DUPLICATE_54d3_return_output;
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
