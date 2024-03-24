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
-- BIN_OP_EQ[uxn_opcodes_h_l854_c6_d272]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal t16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal n16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l854_c2_f9b3]
signal tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l867_c11_a3bb]
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l867_c7_9386]
signal t16_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l867_c7_9386]
signal n16_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l867_c7_9386]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l867_c7_9386]
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l867_c7_9386]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l867_c7_9386]
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l867_c7_9386]
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l867_c7_9386]
signal tmp16_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l870_c11_5e78]
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l870_c7_dff8]
signal t16_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l870_c7_dff8]
signal n16_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_dff8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_dff8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_dff8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_dff8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l870_c7_dff8]
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l870_c7_dff8]
signal tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l875_c11_3585]
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l875_c7_3f32]
signal t16_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l875_c7_3f32]
signal n16_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_3f32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_3f32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_3f32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_3f32]
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l875_c7_3f32]
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l875_c7_3f32]
signal tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l876_c3_e307]
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l879_c11_f3e5]
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l879_c7_a1e6]
signal n16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l879_c7_a1e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_a1e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l879_c7_a1e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_a1e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l879_c7_a1e6]
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l879_c7_a1e6]
signal tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l883_c11_f497]
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l883_c7_8bb3]
signal n16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_8bb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_8bb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_8bb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_8bb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l883_c7_8bb3]
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l883_c7_8bb3]
signal tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l884_c3_5d03]
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l885_c11_c068]
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l886_c30_2672]
signal sp_relative_shift_uxn_opcodes_h_l886_c30_2672_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_2672_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_2672_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_2672_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l891_c11_7567]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_3968]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_3968]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_3968]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l891_c7_3968]
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l894_c31_4be7]
signal CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272
BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output);

-- t16_MUX_uxn_opcodes_h_l854_c2_f9b3
t16_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
t16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- n16_MUX_uxn_opcodes_h_l854_c2_f9b3
n16_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
n16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3
result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3
tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond,
tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue,
tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse,
tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb
BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_left,
BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_right,
BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output);

-- t16_MUX_uxn_opcodes_h_l867_c7_9386
t16_MUX_uxn_opcodes_h_l867_c7_9386 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l867_c7_9386_cond,
t16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue,
t16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse,
t16_MUX_uxn_opcodes_h_l867_c7_9386_return_output);

-- n16_MUX_uxn_opcodes_h_l867_c7_9386
n16_MUX_uxn_opcodes_h_l867_c7_9386 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l867_c7_9386_cond,
n16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue,
n16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse,
n16_MUX_uxn_opcodes_h_l867_c7_9386_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386
result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_cond,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_return_output);

-- tmp16_MUX_uxn_opcodes_h_l867_c7_9386
tmp16_MUX_uxn_opcodes_h_l867_c7_9386 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l867_c7_9386_cond,
tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue,
tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse,
tmp16_MUX_uxn_opcodes_h_l867_c7_9386_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78
BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_left,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_right,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output);

-- t16_MUX_uxn_opcodes_h_l870_c7_dff8
t16_MUX_uxn_opcodes_h_l870_c7_dff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l870_c7_dff8_cond,
t16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue,
t16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse,
t16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output);

-- n16_MUX_uxn_opcodes_h_l870_c7_dff8
n16_MUX_uxn_opcodes_h_l870_c7_dff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l870_c7_dff8_cond,
n16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue,
n16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse,
n16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8
result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_cond,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l870_c7_dff8
tmp16_MUX_uxn_opcodes_h_l870_c7_dff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_cond,
tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue,
tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse,
tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585
BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_left,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_right,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output);

-- t16_MUX_uxn_opcodes_h_l875_c7_3f32
t16_MUX_uxn_opcodes_h_l875_c7_3f32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l875_c7_3f32_cond,
t16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue,
t16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse,
t16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output);

-- n16_MUX_uxn_opcodes_h_l875_c7_3f32
n16_MUX_uxn_opcodes_h_l875_c7_3f32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l875_c7_3f32_cond,
n16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue,
n16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse,
n16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32
result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_cond,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_return_output);

-- tmp16_MUX_uxn_opcodes_h_l875_c7_3f32
tmp16_MUX_uxn_opcodes_h_l875_c7_3f32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_cond,
tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue,
tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse,
tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l876_c3_e307
BIN_OP_OR_uxn_opcodes_h_l876_c3_e307 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_left,
BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_right,
BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5
BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_left,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_right,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output);

-- n16_MUX_uxn_opcodes_h_l879_c7_a1e6
n16_MUX_uxn_opcodes_h_l879_c7_a1e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond,
n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue,
n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse,
n16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6
result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6
tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond,
tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue,
tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse,
tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497
BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_left,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_right,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output);

-- n16_MUX_uxn_opcodes_h_l883_c7_8bb3
n16_MUX_uxn_opcodes_h_l883_c7_8bb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond,
n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue,
n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse,
n16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3
result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3
tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond,
tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue,
tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse,
tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03
BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_left,
BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_right,
BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_left,
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_right,
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_return_output);

-- sp_relative_shift_uxn_opcodes_h_l886_c30_2672
sp_relative_shift_uxn_opcodes_h_l886_c30_2672 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l886_c30_2672_ins,
sp_relative_shift_uxn_opcodes_h_l886_c30_2672_x,
sp_relative_shift_uxn_opcodes_h_l886_c30_2672_y,
sp_relative_shift_uxn_opcodes_h_l886_c30_2672_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567
BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968
result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_cond,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_return_output);

-- CONST_SR_8_uxn_opcodes_h_l894_c31_4be7
CONST_SR_8_uxn_opcodes_h_l894_c31_4be7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_x,
CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed
CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output,
 t16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 n16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output,
 t16_MUX_uxn_opcodes_h_l867_c7_9386_return_output,
 n16_MUX_uxn_opcodes_h_l867_c7_9386_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_return_output,
 tmp16_MUX_uxn_opcodes_h_l867_c7_9386_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output,
 t16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output,
 n16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_return_output,
 tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output,
 t16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output,
 n16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_return_output,
 tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output,
 BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output,
 n16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output,
 tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output,
 n16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output,
 tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_return_output,
 sp_relative_shift_uxn_opcodes_h_l886_c30_2672_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_return_output,
 CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_7c52 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_0943 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_ebfe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_9eb1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_e1d6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_2d4a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l885_c3_e2a3 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_9abb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_bc04 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_ab7a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_01cb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l867_l854_l891_l879_l875_l870_DUPLICATE_5542_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l867_l891_l879_l875_l870_DUPLICATE_1467_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l867_l891_l883_l879_l875_l870_DUPLICATE_ec05_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l867_l883_l879_l875_l870_DUPLICATE_3588_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l871_l876_l884_l880_DUPLICATE_daea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l879_l891_DUPLICATE_5839_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l850_l898_DUPLICATE_9eb6_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_7c52 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_7c52;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_9eb1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_9eb1;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_bc04 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_bc04;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_ab7a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_ab7a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_0943 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_0943;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_2d4a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_2d4a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_e1d6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_e1d6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_ebfe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_ebfe;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l867_l883_l879_l875_l870_DUPLICATE_3588 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l867_l883_l879_l875_l870_DUPLICATE_3588_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c11_7567] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l875_c11_3585] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_left;
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output := BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l870_c11_5e78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_left;
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output := BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l879_c11_f3e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l871_l876_l884_l880_DUPLICATE_daea LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l871_l876_l884_l880_DUPLICATE_daea_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l867_c11_a3bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l886_c30_2672] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l886_c30_2672_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_ins;
     sp_relative_shift_uxn_opcodes_h_l886_c30_2672_x <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_x;
     sp_relative_shift_uxn_opcodes_h_l886_c30_2672_y <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_return_output := sp_relative_shift_uxn_opcodes_h_l886_c30_2672_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l867_l891_l883_l879_l875_l870_DUPLICATE_ec05 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l867_l891_l883_l879_l875_l870_DUPLICATE_ec05_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l879_l891_DUPLICATE_5839 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l879_l891_DUPLICATE_5839_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l883_c11_f497] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_left;
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output := BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l867_l891_l879_l875_l870_DUPLICATE_1467 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l867_l891_l879_l875_l870_DUPLICATE_1467_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l854_c6_d272] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l867_l854_l891_l879_l875_l870_DUPLICATE_5542 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l867_l854_l891_l879_l875_l870_DUPLICATE_5542_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l894_c31_4be7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_return_output := CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_d272_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_a3bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_5e78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_3585_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f3e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_f497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7567_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l871_l876_l884_l880_DUPLICATE_daea_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l871_l876_l884_l880_DUPLICATE_daea_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l871_l876_l884_l880_DUPLICATE_daea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l867_l891_l879_l875_l870_DUPLICATE_1467_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l867_l891_l879_l875_l870_DUPLICATE_1467_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l867_l891_l879_l875_l870_DUPLICATE_1467_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l867_l891_l879_l875_l870_DUPLICATE_1467_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l867_l891_l879_l875_l870_DUPLICATE_1467_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l867_l891_l883_l879_l875_l870_DUPLICATE_ec05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l867_l891_l883_l879_l875_l870_DUPLICATE_ec05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l867_l891_l883_l879_l875_l870_DUPLICATE_ec05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l867_l891_l883_l879_l875_l870_DUPLICATE_ec05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l867_l891_l883_l879_l875_l870_DUPLICATE_ec05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l867_l891_l883_l879_l875_l870_DUPLICATE_ec05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l867_l883_l879_l875_l870_DUPLICATE_3588_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l867_l883_l879_l875_l870_DUPLICATE_3588_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l867_l883_l879_l875_l870_DUPLICATE_3588_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l867_l883_l879_l875_l870_DUPLICATE_3588_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l867_l883_l879_l875_l870_DUPLICATE_3588_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l879_l891_DUPLICATE_5839_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l879_l891_DUPLICATE_5839_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l867_l854_l891_l879_l875_l870_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l867_l854_l891_l879_l875_l870_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l867_l854_l891_l879_l875_l870_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l867_l854_l891_l879_l875_l870_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l867_l854_l891_l879_l875_l870_DUPLICATE_5542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l867_l854_l891_l879_l875_l870_DUPLICATE_5542_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_f9b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_2672_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_3968] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_3968] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l876_c3_e307] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_left;
     BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_return_output := BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_8bb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l884_c3_5d03] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_left;
     BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_return_output := BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l894_c21_01cb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_01cb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_4be7_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_3968] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_e307_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_right := VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_5d03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_01cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_dfed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_3968_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_3968_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_3968_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l891_c7_3968] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_cond;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_return_output := result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_8bb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_8bb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l885_c11_c068] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_left;
     BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_return_output := BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_return_output;

     -- t16_MUX[uxn_opcodes_h_l875_c7_3f32] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l875_c7_3f32_cond <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_cond;
     t16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue;
     t16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output := t16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_a1e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_8bb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;

     -- n16_MUX[uxn_opcodes_h_l883_c7_8bb3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond;
     n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue;
     n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output := n16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l885_c3_e2a3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c068_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_3968_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue := VAR_tmp16_uxn_opcodes_h_l885_c3_e2a3;
     -- n16_MUX[uxn_opcodes_h_l879_c7_a1e6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond;
     n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue;
     n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output := n16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;

     -- t16_MUX[uxn_opcodes_h_l870_c7_dff8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l870_c7_dff8_cond <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_cond;
     t16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue;
     t16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output := t16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l879_c7_a1e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l883_c7_8bb3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_cond;
     tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output := tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_a1e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l889_c21_9abb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_9abb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l885_c3_e2a3);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l879_c7_a1e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_3f32] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_9abb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse := VAR_n16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse := VAR_t16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l883_c7_8bb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l879_c7_a1e6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_cond;
     tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output := tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;

     -- n16_MUX[uxn_opcodes_h_l875_c7_3f32] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l875_c7_3f32_cond <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_cond;
     n16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue;
     n16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output := n16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_3f32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_3f32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;

     -- t16_MUX[uxn_opcodes_h_l867_c7_9386] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l867_c7_9386_cond <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_cond;
     t16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue;
     t16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_return_output := t16_MUX_uxn_opcodes_h_l867_c7_9386_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_dff8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_3f32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8bb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l867_c7_9386_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_dff8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;

     -- n16_MUX[uxn_opcodes_h_l870_c7_dff8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l870_c7_dff8_cond <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_cond;
     n16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue;
     n16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output := n16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_dff8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_dff8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l879_c7_a1e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l867_c7_9386] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l875_c7_3f32] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_cond;
     tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue;
     tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output := tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;

     -- t16_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := t16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse := VAR_n16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_9386_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_a1e6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;
     -- n16_MUX[uxn_opcodes_h_l867_c7_9386] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l867_c7_9386_cond <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_cond;
     n16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue;
     n16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_return_output := n16_MUX_uxn_opcodes_h_l867_c7_9386_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l867_c7_9386] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l875_c7_3f32] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_cond;
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_return_output := result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l870_c7_dff8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_cond;
     tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output := tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l867_c7_9386] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l867_c7_9386] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l867_c7_9386_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_9386_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_9386_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_9386_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_3f32_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l867_c7_9386] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l867_c7_9386_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_cond;
     tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iftrue;
     tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_return_output := tmp16_MUX_uxn_opcodes_h_l867_c7_9386_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l870_c7_dff8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_return_output := result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := n16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_dff8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_9386_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l867_c7_9386] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_cond;
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_return_output := result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_9386_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l854_c2_f9b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l850_l898_DUPLICATE_9eb6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l850_l898_DUPLICATE_9eb6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f9b3_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l850_l898_DUPLICATE_9eb6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l850_l898_DUPLICATE_9eb6_return_output;
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
