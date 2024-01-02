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
-- Submodules: 57
entity jsr2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_609876da;
architecture arch of jsr2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l773_c6_e388]
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l773_c2_21df]
signal t16_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c2_21df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l773_c2_21df]
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l773_c2_21df]
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l773_c2_21df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l773_c2_21df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c2_21df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c2_21df]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l773_c2_21df]
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c2_21df]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l773_c2_21df]
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l786_c11_ab85]
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l786_c7_e6ed]
signal t16_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_e6ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l786_c7_e6ed]
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_e6ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_e6ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_e6ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l786_c7_e6ed]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l786_c7_e6ed]
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_e6ed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l789_c11_54a2]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l789_c7_d4bb]
signal t16_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_d4bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l789_c7_d4bb]
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_d4bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_d4bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_d4bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_d4bb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l789_c7_d4bb]
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_d4bb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l791_c3_0cfa]
signal CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l792_c30_f33a]
signal sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_f640]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l794_c7_3b7d]
signal t16_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_3b7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l794_c7_3b7d]
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_3b7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_3b7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_3b7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_3b7d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l794_c7_3b7d]
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_3b7d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l795_c3_795b]
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l802_c11_f27f]
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_29c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l802_c7_29c8]
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l802_c7_29c8]
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l802_c7_29c8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_29c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_29c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l805_c31_0ba0]
signal CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c942( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388
BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_left,
BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_right,
BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output);

-- t16_MUX_uxn_opcodes_h_l773_c2_21df
t16_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l773_c2_21df_cond,
t16_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
t16_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
t16_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df
result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_cond,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df
result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_cond,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85
BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_left,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_right,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output);

-- t16_MUX_uxn_opcodes_h_l786_c7_e6ed
t16_MUX_uxn_opcodes_h_l786_c7_e6ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l786_c7_e6ed_cond,
t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue,
t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse,
t16_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed
result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed
result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2
BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output);

-- t16_MUX_uxn_opcodes_h_l789_c7_d4bb
t16_MUX_uxn_opcodes_h_l789_c7_d4bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l789_c7_d4bb_cond,
t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue,
t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse,
t16_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb
result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb
result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output);

-- CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa
CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_x,
CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_return_output);

-- sp_relative_shift_uxn_opcodes_h_l792_c30_f33a
sp_relative_shift_uxn_opcodes_h_l792_c30_f33a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_ins,
sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_x,
sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_y,
sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640
BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output);

-- t16_MUX_uxn_opcodes_h_l794_c7_3b7d
t16_MUX_uxn_opcodes_h_l794_c7_3b7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l794_c7_3b7d_cond,
t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue,
t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse,
t16_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d
result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d
result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l795_c3_795b
BIN_OP_OR_uxn_opcodes_h_l795_c3_795b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_left,
BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_right,
BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f
BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_left,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_right,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8
result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8
result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0
CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_x,
CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output,
 t16_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output,
 t16_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output,
 t16_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output,
 CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_return_output,
 sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output,
 t16_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_return_output,
 CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_d8bf : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_a2e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_005f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_7b76 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_1cab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_11b5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_4d0c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_be13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_d1f5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_afbb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_f55d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_aa49_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_c1bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_75a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ed49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5bee_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_7b63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_f933_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l811_l769_DUPLICATE_81de_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_4d0c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_4d0c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_005f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_005f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_7b76 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_7b76;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_be13 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_be13;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_a2e8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_a2e8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_1cab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_1cab;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_d8bf := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_d8bf;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_c1bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_c1bd_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_aa49 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_aa49_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l800_c21_11b5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_11b5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_SR_8[uxn_opcodes_h_l805_c31_0ba0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_return_output := CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_f933 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_f933_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ed49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ed49_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c11_54a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_21df_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_f55d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_f55d_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_21df_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_f640] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5bee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5bee_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l786_c11_ab85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_left;
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output := BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l802_c11_f27f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_left;
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output := BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l792_c30_f33a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_ins;
     sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_x;
     sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_return_output := sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_75a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_75a2_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_afbb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_afbb_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l773_c6_e388] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_left;
     BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output := BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_7b63 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_7b63_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_e388_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_ab85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_54a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_f640_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_f27f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_7b63_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_7b63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_11b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_aa49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_aa49_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_afbb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_afbb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_afbb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_afbb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_afbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_75a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_75a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_75a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_75a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5bee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5bee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5bee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5bee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ed49_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ed49_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ed49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_c1bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_c1bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_c1bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_f933_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_f933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_f55d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_f55d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_f55d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_f55d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_21df_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_21df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_f33a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_3b7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_29c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l795_c3_795b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_left;
     BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_return_output := BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_29c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_29c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l802_c7_29c8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_3b7d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l791_c3_0cfa] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_x <= VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_return_output := CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l802_c7_29c8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output := result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l805_c21_d1f5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_d1f5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0ba0_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_795b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_d1f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_0cfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_3b7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l802_c7_29c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_d4bb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_3b7d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_d4bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_3b7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l794_c7_3b7d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output := result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;

     -- t16_MUX[uxn_opcodes_h_l794_c7_3b7d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l794_c7_3b7d_cond <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_cond;
     t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue;
     t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output := t16_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_3b7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_29c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;
     -- t16_MUX[uxn_opcodes_h_l789_c7_d4bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l789_c7_d4bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_cond;
     t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue;
     t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output := t16_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_d4bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_d4bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l789_c7_d4bb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output := result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_e6ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l786_c7_e6ed] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_d4bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l794_c7_3b7d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output := result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_d4bb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_3b7d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse := VAR_t16_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_e6ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_e6ed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_e6ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_e6ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l789_c7_d4bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;

     -- t16_MUX[uxn_opcodes_h_l786_c7_e6ed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l786_c7_e6ed_cond <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_cond;
     t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue;
     t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output := t16_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l786_c7_e6ed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output := result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_d4bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_t16_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l786_c7_e6ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output := result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- t16_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     t16_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     t16_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_return_output := t16_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_e6ed_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l773_c2_21df_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l773_c2_21df] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_cond;
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output := result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l811_l769_DUPLICATE_81de LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l811_l769_DUPLICATE_81de_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c942(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_21df_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_21df_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l811_l769_DUPLICATE_81de_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l811_l769_DUPLICATE_81de_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
