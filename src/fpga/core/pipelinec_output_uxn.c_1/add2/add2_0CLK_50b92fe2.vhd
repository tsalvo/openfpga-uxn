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
entity add2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_50b92fe2;
architecture arch of add2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l853_c6_ab49]
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l853_c2_2546]
signal n16_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l853_c2_2546]
signal tmp16_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l853_c2_2546]
signal t16_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_2546]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_2546]
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_2546]
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_2546]
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_2546]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_2546]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l853_c2_2546]
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_2546]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_2546]
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l866_c11_f46e]
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l866_c7_ae9f]
signal n16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l866_c7_ae9f]
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l866_c7_ae9f]
signal t16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_ae9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l866_c7_ae9f]
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_ae9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_ae9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_ae9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l869_c11_4d21]
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l869_c7_f0b1]
signal n16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l869_c7_f0b1]
signal tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l869_c7_f0b1]
signal t16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_f0b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l869_c7_f0b1]
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_f0b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_f0b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_f0b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l874_c11_fe47]
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l874_c7_39f6]
signal n16_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l874_c7_39f6]
signal tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l874_c7_39f6]
signal t16_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_39f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l874_c7_39f6]
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_39f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_39f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_39f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l875_c3_f7da]
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l878_c11_f4bf]
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l878_c7_bd8f]
signal n16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l878_c7_bd8f]
signal tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_bd8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l878_c7_bd8f]
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_bd8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_bd8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_bd8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_d953]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l882_c7_98c5]
signal n16_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l882_c7_98c5]
signal tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_98c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l882_c7_98c5]
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_98c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_98c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_98c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l883_c3_6ecf]
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_151e]
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l885_c30_5456]
signal sp_relative_shift_uxn_opcodes_h_l885_c30_5456_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_5456_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_5456_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_5456_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l890_c11_2549]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_2566]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_2566]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_2566]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l890_c7_2566]
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l893_c31_99cf]
signal CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49
BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_left,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_right,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output);

-- n16_MUX_uxn_opcodes_h_l853_c2_2546
n16_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l853_c2_2546_cond,
n16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
n16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
n16_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- tmp16_MUX_uxn_opcodes_h_l853_c2_2546
tmp16_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l853_c2_2546_cond,
tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
tmp16_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- t16_MUX_uxn_opcodes_h_l853_c2_2546
t16_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l853_c2_2546_cond,
t16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
t16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
t16_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546
result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_cond,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e
BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_left,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_right,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output);

-- n16_MUX_uxn_opcodes_h_l866_c7_ae9f
n16_MUX_uxn_opcodes_h_l866_c7_ae9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond,
n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue,
n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse,
n16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f
tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond,
tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue,
tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse,
tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output);

-- t16_MUX_uxn_opcodes_h_l866_c7_ae9f
t16_MUX_uxn_opcodes_h_l866_c7_ae9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond,
t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue,
t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse,
t16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21
BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_left,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_right,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output);

-- n16_MUX_uxn_opcodes_h_l869_c7_f0b1
n16_MUX_uxn_opcodes_h_l869_c7_f0b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond,
n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue,
n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse,
n16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1
tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond,
tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue,
tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse,
tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output);

-- t16_MUX_uxn_opcodes_h_l869_c7_f0b1
t16_MUX_uxn_opcodes_h_l869_c7_f0b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond,
t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue,
t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse,
t16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1
result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47
BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_left,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_right,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output);

-- n16_MUX_uxn_opcodes_h_l874_c7_39f6
n16_MUX_uxn_opcodes_h_l874_c7_39f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l874_c7_39f6_cond,
n16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue,
n16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse,
n16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l874_c7_39f6
tmp16_MUX_uxn_opcodes_h_l874_c7_39f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_cond,
tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue,
tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse,
tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output);

-- t16_MUX_uxn_opcodes_h_l874_c7_39f6
t16_MUX_uxn_opcodes_h_l874_c7_39f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l874_c7_39f6_cond,
t16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue,
t16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse,
t16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6
result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da
BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_left,
BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_right,
BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf
BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_left,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_right,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output);

-- n16_MUX_uxn_opcodes_h_l878_c7_bd8f
n16_MUX_uxn_opcodes_h_l878_c7_bd8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond,
n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue,
n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse,
n16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f
tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond,
tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue,
tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse,
tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f
result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_cond,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953
BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output);

-- n16_MUX_uxn_opcodes_h_l882_c7_98c5
n16_MUX_uxn_opcodes_h_l882_c7_98c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l882_c7_98c5_cond,
n16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue,
n16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse,
n16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l882_c7_98c5
tmp16_MUX_uxn_opcodes_h_l882_c7_98c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_cond,
tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue,
tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse,
tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5
result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_cond,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf
BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_left,
BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_right,
BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_left,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_right,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l885_c30_5456
sp_relative_shift_uxn_opcodes_h_l885_c30_5456 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l885_c30_5456_ins,
sp_relative_shift_uxn_opcodes_h_l885_c30_5456_x,
sp_relative_shift_uxn_opcodes_h_l885_c30_5456_y,
sp_relative_shift_uxn_opcodes_h_l885_c30_5456_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549
BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566
result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_cond,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_return_output);

-- CONST_SR_8_uxn_opcodes_h_l893_c31_99cf
CONST_SR_8_uxn_opcodes_h_l893_c31_99cf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_x,
CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output,
 n16_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 tmp16_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 t16_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output,
 n16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output,
 tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output,
 t16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output,
 n16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output,
 tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output,
 t16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output,
 n16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output,
 tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output,
 t16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output,
 n16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output,
 tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output,
 n16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output,
 tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_return_output,
 sp_relative_shift_uxn_opcodes_h_l885_c30_5456_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_return_output,
 CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_8a25 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_a5b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_e80f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_523b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_d55b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l884_c3_5208 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_1d12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_6e2c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_8753 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_fcc6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_4378_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_d8ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_9f72_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_6d52_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_8a8f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l883_l870_l879_DUPLICATE_630e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l878_l890_DUPLICATE_f68f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l897_l849_DUPLICATE_738b_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_8a25 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_8a25;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_1d12 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_1d12;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_e80f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_e80f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_a5b7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_a5b7;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_8753 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_8753;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_d55b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_d55b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_fcc6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_fcc6;
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_523b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_523b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l893_c31_99cf] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_x <= VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_return_output := CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_2546_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c11_2549] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l853_c6_ab49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_left;
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output := BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_8a8f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_8a8f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l869_c11_4d21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_left;
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output := BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_6d52 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_6d52_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_2546_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_d953] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_d8ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_d8ca_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_2546_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_2546_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l866_c11_f46e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_left;
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output := BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l885_c30_5456] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l885_c30_5456_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_ins;
     sp_relative_shift_uxn_opcodes_h_l885_c30_5456_x <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_x;
     sp_relative_shift_uxn_opcodes_h_l885_c30_5456_y <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_return_output := sp_relative_shift_uxn_opcodes_h_l885_c30_5456_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l874_c11_fe47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_left;
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output := BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l878_l890_DUPLICATE_f68f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l878_l890_DUPLICATE_f68f_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l883_l870_l879_DUPLICATE_630e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l883_l870_l879_DUPLICATE_630e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_9f72 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_9f72_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l878_c11_f4bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_ab49_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_f46e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_4d21_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_fe47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_f4bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_d953_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_2549_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l883_l870_l879_DUPLICATE_630e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l883_l870_l879_DUPLICATE_630e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l883_l870_l879_DUPLICATE_630e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_9f72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_9f72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_9f72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_9f72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_9f72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_8a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_8a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_8a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_8a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_8a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_8a8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_6d52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_6d52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_6d52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_6d52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_6d52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l878_l890_DUPLICATE_f68f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l878_l890_DUPLICATE_f68f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_d8ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_d8ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_d8ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_d8ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_d8ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_d8ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_2546_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_2546_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_2546_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_2546_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_5456_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l893_c21_4378] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_4378_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_99cf_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_2566] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l875_c3_f7da] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_left;
     BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_return_output := BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l883_c3_6ecf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_left;
     BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_return_output := BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_2566] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_98c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_2566] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_f7da_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_right := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_6ecf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_4378_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_d3c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_2566_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_2566_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_2566_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_98c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_98c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l890_c7_2566] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_cond;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_return_output := result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_return_output;

     -- t16_MUX[uxn_opcodes_h_l874_c7_39f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l874_c7_39f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_cond;
     t16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue;
     t16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output := t16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_98c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_151e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_return_output;

     -- n16_MUX[uxn_opcodes_h_l882_c7_98c5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l882_c7_98c5_cond <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_cond;
     n16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue;
     n16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output := n16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_bd8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l884_c3_5208 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_151e_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_2566_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue := VAR_tmp16_uxn_opcodes_h_l884_c3_5208;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l888_c21_6e2c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_6e2c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l884_c3_5208);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_bd8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l882_c7_98c5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_cond;
     tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output := tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_39f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_bd8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_bd8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;

     -- n16_MUX[uxn_opcodes_h_l878_c7_bd8f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond;
     n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue;
     n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output := n16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;

     -- t16_MUX[uxn_opcodes_h_l869_c7_f0b1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond;
     t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue;
     t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output := t16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_6e2c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_39f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l878_c7_bd8f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_cond;
     tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output := tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_39f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;

     -- t16_MUX[uxn_opcodes_h_l866_c7_ae9f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond;
     t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue;
     t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output := t16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_f0b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l882_c7_98c5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_return_output := result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_39f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l874_c7_39f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l874_c7_39f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_cond;
     n16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue;
     n16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output := n16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_98c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_t16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;
     -- n16_MUX[uxn_opcodes_h_l869_c7_f0b1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond;
     n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue;
     n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output := n16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_f0b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l878_c7_bd8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output := result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_f0b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_ae9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;

     -- t16_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     t16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     t16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_return_output := t16_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_f0b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l874_c7_39f6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_cond;
     tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output := tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_bd8f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l853_c2_2546_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;
     -- n16_MUX[uxn_opcodes_h_l866_c7_ae9f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond;
     n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue;
     n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output := n16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_ae9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l869_c7_f0b1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_cond;
     tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output := tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_ae9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_ae9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l874_c7_39f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_n16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_39f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- n16_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     n16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     n16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_return_output := n16_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l869_c7_f0b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l866_c7_ae9f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_cond;
     tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output := tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l853_c2_2546_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_f0b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_return_output := tmp16_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l866_c7_ae9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ae9f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_2546_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l853_c2_2546] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_cond;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_return_output := result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l897_l849_DUPLICATE_738b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l897_l849_DUPLICATE_738b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_2546_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_2546_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l897_l849_DUPLICATE_738b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l897_l849_DUPLICATE_738b_return_output;
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
