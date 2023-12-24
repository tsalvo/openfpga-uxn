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
-- BIN_OP_EQ[uxn_opcodes_h_l773_c6_8767]
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l773_c2_1611]
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c2_1611]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c2_1611]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l773_c2_1611]
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l773_c2_1611]
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c2_1611]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c2_1611]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l773_c2_1611]
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l773_c2_1611]
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l773_c2_1611]
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l773_c2_1611]
signal t16_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l786_c11_7437]
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l786_c7_ff2c]
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l786_c7_ff2c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_ff2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l786_c7_ff2c]
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_ff2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_ff2c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_ff2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_ff2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l786_c7_ff2c]
signal t16_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l789_c11_21b9]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l789_c7_212c]
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_212c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_212c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l789_c7_212c]
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_212c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_212c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_212c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_212c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l789_c7_212c]
signal t16_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l791_c3_4dbc]
signal CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l792_c30_69ad]
signal sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_0f45]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l794_c7_0349]
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_0349]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_0349]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l794_c7_0349]
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_0349]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_0349]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_0349]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_0349]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l794_c7_0349]
signal t16_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l795_c3_fdbb]
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l802_c11_2a16]
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l802_c7_6c00]
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_6c00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_6c00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l802_c7_6c00]
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l802_c7_6c00]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_6c00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l805_c31_0779]
signal CONST_SR_8_uxn_opcodes_h_l805_c31_0779_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l805_c31_0779_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e482( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767
BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_left,
BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_right,
BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611
result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_cond,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611
result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_cond,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- t16_MUX_uxn_opcodes_h_l773_c2_1611
t16_MUX_uxn_opcodes_h_l773_c2_1611 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l773_c2_1611_cond,
t16_MUX_uxn_opcodes_h_l773_c2_1611_iftrue,
t16_MUX_uxn_opcodes_h_l773_c2_1611_iffalse,
t16_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437
BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_left,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_right,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c
result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c
result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output);

-- t16_MUX_uxn_opcodes_h_l786_c7_ff2c
t16_MUX_uxn_opcodes_h_l786_c7_ff2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l786_c7_ff2c_cond,
t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue,
t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse,
t16_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9
BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c
result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_cond,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c
result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_cond,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_return_output);

-- t16_MUX_uxn_opcodes_h_l789_c7_212c
t16_MUX_uxn_opcodes_h_l789_c7_212c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l789_c7_212c_cond,
t16_MUX_uxn_opcodes_h_l789_c7_212c_iftrue,
t16_MUX_uxn_opcodes_h_l789_c7_212c_iffalse,
t16_MUX_uxn_opcodes_h_l789_c7_212c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc
CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_x,
CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l792_c30_69ad
sp_relative_shift_uxn_opcodes_h_l792_c30_69ad : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_ins,
sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_x,
sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_y,
sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45
BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349
result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_cond,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349
result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_cond,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_return_output);

-- t16_MUX_uxn_opcodes_h_l794_c7_0349
t16_MUX_uxn_opcodes_h_l794_c7_0349 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l794_c7_0349_cond,
t16_MUX_uxn_opcodes_h_l794_c7_0349_iftrue,
t16_MUX_uxn_opcodes_h_l794_c7_0349_iffalse,
t16_MUX_uxn_opcodes_h_l794_c7_0349_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb
BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_left,
BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_right,
BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16
BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_left,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_right,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00
result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00
result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_return_output);

-- CONST_SR_8_uxn_opcodes_h_l805_c31_0779
CONST_SR_8_uxn_opcodes_h_l805_c31_0779 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l805_c31_0779_x,
CONST_SR_8_uxn_opcodes_h_l805_c31_0779_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 t16_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output,
 t16_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_return_output,
 t16_MUX_uxn_opcodes_h_l789_c7_212c_return_output,
 CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_return_output,
 sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_return_output,
 t16_MUX_uxn_opcodes_h_l794_c7_0349_return_output,
 BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_return_output,
 CONST_SR_8_uxn_opcodes_h_l805_c31_0779_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_6c54 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_1eb5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_ab1a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_4325 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_50c7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_6359_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_0b13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_e99a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0779_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0779_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_c5b8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l789_l773_l786_l802_DUPLICATE_6494_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l789_l773_l802_l794_l786_DUPLICATE_097e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_e0b6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l786_l802_DUPLICATE_d55f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_1bee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_ce73_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_d3f8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_1157_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l789_l802_DUPLICATE_8ca3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l811_l769_DUPLICATE_8632_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_6c54 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_6c54;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_ab1a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_ab1a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_4325 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_4325;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_1eb5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_1eb5;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_0b13 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_0b13;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_e99a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_e99a;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_50c7 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_50c7;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0779_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l773_c6_8767] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_left;
     BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output := BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l800_c21_6359] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_6359_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_e0b6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_e0b6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c11_21b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_1611_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_1611_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l786_l802_DUPLICATE_d55f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l786_l802_DUPLICATE_d55f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_ce73 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_ce73_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_1bee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_1bee_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_d3f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_d3f8_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l792_c30_69ad] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_ins;
     sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_x <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_x;
     sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_y <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_return_output := sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l805_c31_0779] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l805_c31_0779_x <= VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0779_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0779_return_output := CONST_SR_8_uxn_opcodes_h_l805_c31_0779_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l802_c11_2a16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_left;
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output := BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_1157 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_1157_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_0f45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l786_c11_7437] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_left;
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output := BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l789_l773_l786_l802_DUPLICATE_6494 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l789_l773_l786_l802_DUPLICATE_6494_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l789_l773_l802_l794_l786_DUPLICATE_097e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l789_l773_l802_l794_l786_DUPLICATE_097e_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l789_l802_DUPLICATE_8ca3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l789_l802_DUPLICATE_8ca3_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_8767_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_7437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_21b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0f45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_2a16_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_1157_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_1157_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_6359_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l786_l802_DUPLICATE_d55f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l786_l802_DUPLICATE_d55f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l789_l773_l802_l794_l786_DUPLICATE_097e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l789_l773_l802_l794_l786_DUPLICATE_097e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l789_l773_l802_l794_l786_DUPLICATE_097e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l789_l773_l802_l794_l786_DUPLICATE_097e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l789_l773_l802_l794_l786_DUPLICATE_097e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_ce73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_ce73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_ce73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_ce73_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_1bee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_1bee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_1bee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l789_l786_l802_DUPLICATE_1bee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_e0b6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_e0b6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_e0b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_d3f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_d3f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l789_l786_DUPLICATE_d3f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l789_l802_DUPLICATE_8ca3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l789_l802_DUPLICATE_8ca3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l789_l773_l786_l802_DUPLICATE_6494_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l789_l773_l786_l802_DUPLICATE_6494_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l789_l773_l786_l802_DUPLICATE_6494_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l789_l773_l786_l802_DUPLICATE_6494_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_1611_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_1611_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_69ad_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_6c00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_6c00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_6c00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l805_c21_c5b8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_c5b8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_0779_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l802_c7_6c00] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond;
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output := result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_0349] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l791_c3_4dbc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_return_output := CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l795_c3_fdbb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_left;
     BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_return_output := BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l802_c7_6c00] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_0349] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_fdbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_c5b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_4dbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_0349_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_0349_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_0349] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_212c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_0349] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_0349] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_return_output;

     -- t16_MUX[uxn_opcodes_h_l794_c7_0349] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l794_c7_0349_cond <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_cond;
     t16_MUX_uxn_opcodes_h_l794_c7_0349_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_iftrue;
     t16_MUX_uxn_opcodes_h_l794_c7_0349_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_return_output := t16_MUX_uxn_opcodes_h_l794_c7_0349_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_0349] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l802_c7_6c00] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_cond;
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output := result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l794_c7_0349] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_cond;
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output := result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_212c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_0349_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_0349_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_212c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_212c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_0349_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_0349_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_6c00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l794_c7_0349_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_212c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l789_c7_212c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output := result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output;

     -- t16_MUX[uxn_opcodes_h_l789_c7_212c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l789_c7_212c_cond <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_cond;
     t16_MUX_uxn_opcodes_h_l789_c7_212c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_iftrue;
     t16_MUX_uxn_opcodes_h_l789_c7_212c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_return_output := t16_MUX_uxn_opcodes_h_l789_c7_212c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_ff2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_212c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_212c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l794_c7_0349] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_cond;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output := result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l786_c7_ff2c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_212c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_212c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_212c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_212c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_212c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_0349_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l789_c7_212c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l786_c7_ff2c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output := result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- t16_MUX[uxn_opcodes_h_l786_c7_ff2c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l786_c7_ff2c_cond <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_cond;
     t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue;
     t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output := t16_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_ff2c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_ff2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_ff2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_ff2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l789_c7_212c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output := result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_212c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_t16_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l786_c7_ff2c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output := result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;

     -- t16_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     t16_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     t16_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_return_output := t16_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output := result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_ff2c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l773_c2_1611_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l773_c2_1611] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_cond;
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output := result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l811_l769_DUPLICATE_8632 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l811_l769_DUPLICATE_8632_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e482(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_1611_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l811_l769_DUPLICATE_8632_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l811_l769_DUPLICATE_8632_return_output;
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
