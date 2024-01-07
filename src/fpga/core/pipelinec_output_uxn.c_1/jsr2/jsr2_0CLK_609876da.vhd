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
-- BIN_OP_EQ[uxn_opcodes_h_l773_c6_30d6]
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c2_8b02]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l773_c2_8b02]
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l773_c2_8b02]
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l773_c2_8b02]
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l773_c2_8b02]
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c2_8b02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l773_c2_8b02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c2_8b02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c2_8b02]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l773_c2_8b02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l773_c2_8b02]
signal t16_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l786_c11_264b]
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_058f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l786_c7_058f]
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l786_c7_058f]
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_058f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_058f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_058f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l786_c7_058f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_058f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l786_c7_058f]
signal t16_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l789_c11_2bec]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_e642]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l789_c7_e642]
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l789_c7_e642]
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_e642]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_e642]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_e642]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_e642]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_e642]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l789_c7_e642]
signal t16_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l791_c3_5266]
signal CONST_SL_8_uxn_opcodes_h_l791_c3_5266_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l791_c3_5266_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l792_c30_5642]
signal sp_relative_shift_uxn_opcodes_h_l792_c30_5642_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_5642_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_5642_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_5642_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_257b]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_0b8e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l794_c7_0b8e]
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l794_c7_0b8e]
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_0b8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_0b8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_0b8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_0b8e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_0b8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l794_c7_0b8e]
signal t16_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l795_c3_2008]
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l802_c11_a64d]
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l802_c7_dda6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_dda6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l802_c7_dda6]
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l802_c7_dda6]
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_dda6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_dda6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l805_c31_f48a]
signal CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_500b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6
BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_left,
BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_right,
BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02
result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02
result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- t16_MUX_uxn_opcodes_h_l773_c2_8b02
t16_MUX_uxn_opcodes_h_l773_c2_8b02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l773_c2_8b02_cond,
t16_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue,
t16_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse,
t16_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b
BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_left,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_right,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f
result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_cond,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f
result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_cond,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_return_output);

-- t16_MUX_uxn_opcodes_h_l786_c7_058f
t16_MUX_uxn_opcodes_h_l786_c7_058f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l786_c7_058f_cond,
t16_MUX_uxn_opcodes_h_l786_c7_058f_iftrue,
t16_MUX_uxn_opcodes_h_l786_c7_058f_iffalse,
t16_MUX_uxn_opcodes_h_l786_c7_058f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec
BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642
result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_cond,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642
result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_cond,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_return_output);

-- t16_MUX_uxn_opcodes_h_l789_c7_e642
t16_MUX_uxn_opcodes_h_l789_c7_e642 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l789_c7_e642_cond,
t16_MUX_uxn_opcodes_h_l789_c7_e642_iftrue,
t16_MUX_uxn_opcodes_h_l789_c7_e642_iffalse,
t16_MUX_uxn_opcodes_h_l789_c7_e642_return_output);

-- CONST_SL_8_uxn_opcodes_h_l791_c3_5266
CONST_SL_8_uxn_opcodes_h_l791_c3_5266 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l791_c3_5266_x,
CONST_SL_8_uxn_opcodes_h_l791_c3_5266_return_output);

-- sp_relative_shift_uxn_opcodes_h_l792_c30_5642
sp_relative_shift_uxn_opcodes_h_l792_c30_5642 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l792_c30_5642_ins,
sp_relative_shift_uxn_opcodes_h_l792_c30_5642_x,
sp_relative_shift_uxn_opcodes_h_l792_c30_5642_y,
sp_relative_shift_uxn_opcodes_h_l792_c30_5642_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b
BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e
result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e
result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output);

-- t16_MUX_uxn_opcodes_h_l794_c7_0b8e
t16_MUX_uxn_opcodes_h_l794_c7_0b8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l794_c7_0b8e_cond,
t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue,
t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse,
t16_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l795_c3_2008
BIN_OP_OR_uxn_opcodes_h_l795_c3_2008 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_left,
BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_right,
BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d
BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_left,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_right,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6
result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6
result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l805_c31_f48a
CONST_SR_8_uxn_opcodes_h_l805_c31_f48a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_x,
CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 t16_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_return_output,
 t16_MUX_uxn_opcodes_h_l786_c7_058f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_return_output,
 t16_MUX_uxn_opcodes_h_l789_c7_e642_return_output,
 CONST_SL_8_uxn_opcodes_h_l791_c3_5266_return_output,
 sp_relative_shift_uxn_opcodes_h_l792_c30_5642_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output,
 t16_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_return_output,
 CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_a475 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_b02d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_d129 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_5266_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_5266_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_aa0d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_43d9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_3898_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_1834 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_226f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_9eec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_85eb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_0740_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5b53_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_4523_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_dc6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_3f9b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_d1fb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_c6cf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_3937_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l811_l769_DUPLICATE_e068_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_1834 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_1834;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_b02d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_b02d;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_d129 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_d129;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_aa0d := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_aa0d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_a475 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_a475;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_43d9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_43d9;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_226f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_226f;
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l786_c11_264b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_left;
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output := BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l802_c11_a64d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_left;
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output := BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5b53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5b53_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_8b02_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_4523 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_4523_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l792_c30_5642] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l792_c30_5642_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_ins;
     sp_relative_shift_uxn_opcodes_h_l792_c30_5642_x <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_x;
     sp_relative_shift_uxn_opcodes_h_l792_c30_5642_y <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_return_output := sp_relative_shift_uxn_opcodes_h_l792_c30_5642_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_85eb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_85eb_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_d1fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_d1fb_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l800_c21_3898] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_3898_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_SR_8[uxn_opcodes_h_l805_c31_f48a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_return_output := CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l773_c6_30d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_3f9b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_3f9b_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_8b02_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_3937 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_3937_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_dc6e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_dc6e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_257b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_c6cf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_c6cf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c11_2bec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_0740 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_0740_return_output := result.u16_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_30d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_264b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_2bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_257b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_a64d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_c6cf_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_5266_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_c6cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_3898_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_4523_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_4523_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_0740_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_0740_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_0740_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_0740_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l773_l789_l786_l794_l802_DUPLICATE_0740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_d1fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_d1fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_d1fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_d1fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5b53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5b53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5b53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5b53_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_3f9b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_3f9b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_3f9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_dc6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_dc6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_dc6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_3937_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_3937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_85eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_85eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_85eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_85eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_8b02_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_8b02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_5642_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l791_c3_5266] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l791_c3_5266_x <= VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_5266_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_5266_return_output := CONST_SL_8_uxn_opcodes_h_l791_c3_5266_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l802_c7_dda6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l802_c7_dda6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output := result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_dda6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_dda6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_dda6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l795_c3_2008] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_left;
     BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_return_output := BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_0b8e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l805_c21_9eec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_9eec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_f48a_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_0b8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_2008_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_9eec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_0b8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_0b8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_0b8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_0b8e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_e642] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l802_c7_dda6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output := result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l794_c7_0b8e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output := result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_e642] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_return_output;

     -- t16_MUX[uxn_opcodes_h_l794_c7_0b8e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l794_c7_0b8e_cond <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_cond;
     t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue;
     t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output := t16_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_e642_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_e642_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_dda6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_iffalse := VAR_t16_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;
     -- t16_MUX[uxn_opcodes_h_l789_c7_e642] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l789_c7_e642_cond <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_cond;
     t16_MUX_uxn_opcodes_h_l789_c7_e642_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_iftrue;
     t16_MUX_uxn_opcodes_h_l789_c7_e642_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_return_output := t16_MUX_uxn_opcodes_h_l789_c7_e642_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l789_c7_e642] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_cond;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output := result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_058f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_e642] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_e642] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_e642] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_e642] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l794_c7_0b8e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output := result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l786_c7_058f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_e642_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_e642_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_058f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_058f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_e642_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_e642_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0b8e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l789_c7_e642_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_058f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_058f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l786_c7_058f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output := result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_058f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l789_c7_e642] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_cond;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output := result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output;

     -- t16_MUX[uxn_opcodes_h_l786_c7_058f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l786_c7_058f_cond <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_cond;
     t16_MUX_uxn_opcodes_h_l786_c7_058f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_iftrue;
     t16_MUX_uxn_opcodes_h_l786_c7_058f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_return_output := t16_MUX_uxn_opcodes_h_l786_c7_058f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_058f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_058f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_058f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_058f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_058f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_e642_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_t16_MUX_uxn_opcodes_h_l786_c7_058f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l786_c7_058f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output := result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output;

     -- t16_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     t16_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     t16_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := t16_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_058f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l773_c2_8b02] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_cond;
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output := result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l811_l769_DUPLICATE_e068 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l811_l769_DUPLICATE_e068_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_500b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_8b02_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_8b02_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l811_l769_DUPLICATE_e068_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l811_l769_DUPLICATE_e068_return_output;
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
