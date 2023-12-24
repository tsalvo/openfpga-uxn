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
-- BIN_OP_EQ[uxn_opcodes_h_l790_c6_cd56]
signal BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l790_c2_341a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l790_c2_341a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c2_341a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l790_c2_341a]
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l790_c2_341a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l790_c2_341a]
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c2_341a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c2_341a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c2_341a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l790_c2_341a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l790_c2_341a]
signal t16_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l803_c11_48d6]
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l803_c7_2214]
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l803_c7_2214]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l803_c7_2214]
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_2214]
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l803_c7_2214]
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_2214]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_2214]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_2214]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l803_c7_2214]
signal t16_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l806_c11_14fe]
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_7264]
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l806_c7_7264]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l806_c7_7264]
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_7264]
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l806_c7_7264]
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_7264]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l806_c7_7264]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_7264]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l806_c7_7264]
signal t16_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l808_c3_9627]
signal CONST_SL_8_uxn_opcodes_h_l808_c3_9627_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l808_c3_9627_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l809_c30_2482]
signal sp_relative_shift_uxn_opcodes_h_l809_c30_2482_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l809_c30_2482_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l809_c30_2482_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l809_c30_2482_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l811_c11_6323]
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_ff74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l811_c7_ff74]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l811_c7_ff74]
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_ff74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l811_c7_ff74]
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l811_c7_ff74]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l811_c7_ff74]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_ff74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l811_c7_ff74]
signal t16_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l812_c3_cb5a]
signal BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l819_c11_45b0]
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l819_c7_9172]
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c7_9172]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c7_9172]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c7_9172]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l819_c7_9172]
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l819_c7_9172]
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l822_c31_fda8]
signal CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_775a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56
BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_left,
BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_right,
BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a
result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_cond,
result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a
result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_cond,
result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- t16_MUX_uxn_opcodes_h_l790_c2_341a
t16_MUX_uxn_opcodes_h_l790_c2_341a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l790_c2_341a_cond,
t16_MUX_uxn_opcodes_h_l790_c2_341a_iftrue,
t16_MUX_uxn_opcodes_h_l790_c2_341a_iffalse,
t16_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6
BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_left,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_right,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214
result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_cond,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214
result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_cond,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_return_output);

-- t16_MUX_uxn_opcodes_h_l803_c7_2214
t16_MUX_uxn_opcodes_h_l803_c7_2214 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l803_c7_2214_cond,
t16_MUX_uxn_opcodes_h_l803_c7_2214_iftrue,
t16_MUX_uxn_opcodes_h_l803_c7_2214_iffalse,
t16_MUX_uxn_opcodes_h_l803_c7_2214_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe
BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_left,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_right,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264
result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_cond,
result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264
result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_cond,
result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_return_output);

-- t16_MUX_uxn_opcodes_h_l806_c7_7264
t16_MUX_uxn_opcodes_h_l806_c7_7264 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l806_c7_7264_cond,
t16_MUX_uxn_opcodes_h_l806_c7_7264_iftrue,
t16_MUX_uxn_opcodes_h_l806_c7_7264_iffalse,
t16_MUX_uxn_opcodes_h_l806_c7_7264_return_output);

-- CONST_SL_8_uxn_opcodes_h_l808_c3_9627
CONST_SL_8_uxn_opcodes_h_l808_c3_9627 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l808_c3_9627_x,
CONST_SL_8_uxn_opcodes_h_l808_c3_9627_return_output);

-- sp_relative_shift_uxn_opcodes_h_l809_c30_2482
sp_relative_shift_uxn_opcodes_h_l809_c30_2482 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l809_c30_2482_ins,
sp_relative_shift_uxn_opcodes_h_l809_c30_2482_x,
sp_relative_shift_uxn_opcodes_h_l809_c30_2482_y,
sp_relative_shift_uxn_opcodes_h_l809_c30_2482_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323
BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_left,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_right,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74
result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74
result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_return_output);

-- t16_MUX_uxn_opcodes_h_l811_c7_ff74
t16_MUX_uxn_opcodes_h_l811_c7_ff74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l811_c7_ff74_cond,
t16_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue,
t16_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse,
t16_MUX_uxn_opcodes_h_l811_c7_ff74_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a
BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_left,
BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_right,
BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0
BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_left,
BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_right,
BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172
result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_cond,
result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172
result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_cond,
result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_return_output);

-- CONST_SR_8_uxn_opcodes_h_l822_c31_fda8
CONST_SR_8_uxn_opcodes_h_l822_c31_fda8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_x,
CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 t16_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_return_output,
 t16_MUX_uxn_opcodes_h_l803_c7_2214_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_return_output,
 t16_MUX_uxn_opcodes_h_l806_c7_7264_return_output,
 CONST_SL_8_uxn_opcodes_h_l808_c3_9627_return_output,
 sp_relative_shift_uxn_opcodes_h_l809_c30_2482_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_return_output,
 t16_MUX_uxn_opcodes_h_l811_c7_ff74_return_output,
 BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_return_output,
 CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l795_c3_bfd9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_dfba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_20d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_9627_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_9627_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l814_c3_1b23 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_a964 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l817_c21_1fbc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_9677 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l820_c3_1616 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_dee0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l806_l790_l819_l803_DUPLICATE_7803_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l806_l811_l803_l819_l790_DUPLICATE_0095_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_f941_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_92ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_fd92_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l819_l803_DUPLICATE_d925_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_6df4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l807_DUPLICATE_cb9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l806_l819_DUPLICATE_044a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l828_l786_DUPLICATE_ded4_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l814_c3_1b23 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l814_c3_1b23;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_a964 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_a964;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l795_c3_bfd9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l795_c3_bfd9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_9677 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_9677;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l820_c3_1616 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l820_c3_1616;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_dfba := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_dfba;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_20d0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_20d0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l819_c11_45b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_f941 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_f941_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l817_c21_1fbc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l817_c21_1fbc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l790_c2_341a_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l822_c31_fda8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_return_output := CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l807_DUPLICATE_cb9d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l807_DUPLICATE_cb9d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l819_l803_DUPLICATE_d925 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l819_l803_DUPLICATE_d925_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l809_c30_2482] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l809_c30_2482_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_ins;
     sp_relative_shift_uxn_opcodes_h_l809_c30_2482_x <= VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_x;
     sp_relative_shift_uxn_opcodes_h_l809_c30_2482_y <= VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_return_output := sp_relative_shift_uxn_opcodes_h_l809_c30_2482_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l806_l819_DUPLICATE_044a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l806_l819_DUPLICATE_044a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l806_c11_14fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_92ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_92ee_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_6df4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_6df4_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l790_c6_cd56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_left;
     BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output := BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l803_c11_48d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_fd92 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_fd92_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l811_c11_6323] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_left;
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output := BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l790_c2_341a_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l806_l790_l819_l803_DUPLICATE_7803 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l806_l790_l819_l803_DUPLICATE_7803_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l806_l811_l803_l819_l790_DUPLICATE_0095 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l806_l811_l803_l819_l790_DUPLICATE_0095_return_output := result.u16_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_cd56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_48d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_14fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_6323_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_45b0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l807_DUPLICATE_cb9d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_9627_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l807_DUPLICATE_cb9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l817_c21_1fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l819_l803_DUPLICATE_d925_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l819_l803_DUPLICATE_d925_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l806_l811_l803_l819_l790_DUPLICATE_0095_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l806_l811_l803_l819_l790_DUPLICATE_0095_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l806_l811_l803_l819_l790_DUPLICATE_0095_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l806_l811_l803_l819_l790_DUPLICATE_0095_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l806_l811_l803_l819_l790_DUPLICATE_0095_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_fd92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_fd92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_fd92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_fd92_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_6df4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_6df4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_6df4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l806_l811_l819_l803_DUPLICATE_6df4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_92ee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_92ee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_92ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_f941_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_f941_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_f941_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l806_l819_DUPLICATE_044a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l806_l819_DUPLICATE_044a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l806_l790_l819_l803_DUPLICATE_7803_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l806_l790_l819_l803_DUPLICATE_7803_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l806_l790_l819_l803_DUPLICATE_7803_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l806_l790_l819_l803_DUPLICATE_7803_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l790_c2_341a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l790_c2_341a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_2482_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_ff74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l819_c7_9172] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l811_c7_ff74] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l819_c7_9172] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_cond;
     result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output := result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l822_c21_dee0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_dee0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_fda8_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l812_c3_cb5a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_left;
     BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_return_output := BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c7_9172] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c7_9172] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l808_c3_9627] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l808_c3_9627_x <= VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_9627_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_9627_return_output := CONST_SL_8_uxn_opcodes_h_l808_c3_9627_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c7_9172] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_cb5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_dee0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_9627_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9172_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9172_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9172_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9172_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l811_c7_ff74] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond;
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output := result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;

     -- t16_MUX[uxn_opcodes_h_l811_c7_ff74] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l811_c7_ff74_cond <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_cond;
     t16_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue;
     t16_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_return_output := t16_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_7264] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_ff74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l819_c7_9172] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_cond;
     result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output := result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l811_c7_ff74] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l811_c7_ff74] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_ff74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l806_c7_7264] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_7264_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_7264_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_9172_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_iffalse := VAR_t16_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;
     -- t16_MUX[uxn_opcodes_h_l806_c7_7264] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l806_c7_7264_cond <= VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_cond;
     t16_MUX_uxn_opcodes_h_l806_c7_7264_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_iftrue;
     t16_MUX_uxn_opcodes_h_l806_c7_7264_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_return_output := t16_MUX_uxn_opcodes_h_l806_c7_7264_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_7264] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l806_c7_7264] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_cond;
     result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output := result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_7264] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l803_c7_2214] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l803_c7_2214] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_7264] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l806_c7_7264] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l811_c7_ff74] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_cond;
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output := result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_7264_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_7264_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_2214_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_2214_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_7264_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_7264_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_ff74_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_iffalse := VAR_t16_MUX_uxn_opcodes_h_l806_c7_7264_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l806_c7_7264] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_cond;
     result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output := result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_2214] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l803_c7_2214] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_cond;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output := result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_2214] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_2214] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_2214] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_return_output;

     -- t16_MUX[uxn_opcodes_h_l803_c7_2214] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l803_c7_2214_cond <= VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_cond;
     t16_MUX_uxn_opcodes_h_l803_c7_2214_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_iftrue;
     t16_MUX_uxn_opcodes_h_l803_c7_2214_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_return_output := t16_MUX_uxn_opcodes_h_l803_c7_2214_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_2214_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_2214_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_2214_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_2214_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_7264_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l803_c7_2214_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l803_c7_2214] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_cond;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output := result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- t16_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     t16_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     t16_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_return_output := t16_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output := result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_2214_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l790_c2_341a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l790_c2_341a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output := result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l828_l786_DUPLICATE_ded4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l828_l786_DUPLICATE_ded4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_341a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_341a_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l828_l786_DUPLICATE_ded4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l828_l786_DUPLICATE_ded4_return_output;
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
