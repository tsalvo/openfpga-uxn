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
-- BIN_OP_EQ[uxn_opcodes_h_l790_c6_4d65]
signal BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l790_c2_3c66]
signal t16_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l790_c2_3c66]
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l790_c2_3c66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c2_3c66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c2_3c66]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c2_3c66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l790_c2_3c66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c2_3c66]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l790_c2_3c66]
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l790_c2_3c66]
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l790_c2_3c66]
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l803_c11_1a77]
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l803_c7_c187]
signal t16_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_c187]
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_c187]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l803_c7_c187]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_c187]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l803_c7_c187]
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_c187]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l803_c7_c187]
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l803_c7_c187]
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l806_c11_30ef]
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l806_c7_08c8]
signal t16_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_08c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_08c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l806_c7_08c8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_08c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_08c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l806_c7_08c8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l806_c7_08c8]
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l806_c7_08c8]
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l808_c3_b7f0]
signal CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l809_c30_d98d]
signal sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l811_c11_bb83]
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l811_c7_49b0]
signal t16_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_49b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l811_c7_49b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l811_c7_49b0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_49b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_49b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l811_c7_49b0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l811_c7_49b0]
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l811_c7_49b0]
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l812_c3_faae]
signal BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l819_c11_6174]
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c7_aab5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l819_c7_aab5]
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l819_c7_aab5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c7_aab5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l819_c7_aab5]
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c7_aab5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l822_c31_7740]
signal CONST_SR_8_uxn_opcodes_h_l822_c31_7740_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l822_c31_7740_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_42c1( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65
BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_left,
BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_right,
BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output);

-- t16_MUX_uxn_opcodes_h_l790_c2_3c66
t16_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
t16_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
t16_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
t16_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66
result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66
result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77
BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_left,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_right,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output);

-- t16_MUX_uxn_opcodes_h_l803_c7_c187
t16_MUX_uxn_opcodes_h_l803_c7_c187 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l803_c7_c187_cond,
t16_MUX_uxn_opcodes_h_l803_c7_c187_iftrue,
t16_MUX_uxn_opcodes_h_l803_c7_c187_iffalse,
t16_MUX_uxn_opcodes_h_l803_c7_c187_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187
result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_cond,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187
result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_cond,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef
BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_left,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_right,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output);

-- t16_MUX_uxn_opcodes_h_l806_c7_08c8
t16_MUX_uxn_opcodes_h_l806_c7_08c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l806_c7_08c8_cond,
t16_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue,
t16_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse,
t16_MUX_uxn_opcodes_h_l806_c7_08c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8
result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond,
result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8
result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output);

-- CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0
CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_x,
CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l809_c30_d98d
sp_relative_shift_uxn_opcodes_h_l809_c30_d98d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_ins,
sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_x,
sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_y,
sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83
BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_left,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_right,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output);

-- t16_MUX_uxn_opcodes_h_l811_c7_49b0
t16_MUX_uxn_opcodes_h_l811_c7_49b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l811_c7_49b0_cond,
t16_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue,
t16_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse,
t16_MUX_uxn_opcodes_h_l811_c7_49b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0
result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0
result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l812_c3_faae
BIN_OP_OR_uxn_opcodes_h_l812_c3_faae : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_left,
BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_right,
BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174
BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_left,
BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_right,
BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5
result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond,
result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5
result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond,
result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l822_c31_7740
CONST_SR_8_uxn_opcodes_h_l822_c31_7740 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l822_c31_7740_x,
CONST_SR_8_uxn_opcodes_h_l822_c31_7740_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output,
 t16_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output,
 t16_MUX_uxn_opcodes_h_l803_c7_c187_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output,
 t16_MUX_uxn_opcodes_h_l806_c7_08c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output,
 CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_return_output,
 sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output,
 t16_MUX_uxn_opcodes_h_l811_c7_49b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_return_output,
 CONST_SR_8_uxn_opcodes_h_l822_c31_7740_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l795_c3_08e8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_face : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_cf72 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l814_c3_f5aa : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_3a5f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l817_c21_7cad_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l820_c3_d101 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_83ed : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_7740_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_7740_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_4abe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l819_l811_l790_l803_l806_DUPLICATE_9e23_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l806_l790_l803_DUPLICATE_8045_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_f55d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l819_l803_DUPLICATE_b9d2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_d56e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_ceb2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_ee25_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l807_DUPLICATE_f2e5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l806_l819_DUPLICATE_e66f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l828_l786_DUPLICATE_a416_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l820_c3_d101 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l820_c3_d101;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_face := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_face;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l814_c3_f5aa := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l814_c3_f5aa;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_83ed := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_83ed;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_3a5f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_3a5f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_cf72 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_cf72;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l795_c3_08e8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l795_c3_08e8;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_7740_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l819_c11_6174] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_left;
     BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output := BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l806_l790_l803_DUPLICATE_8045 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l806_l790_l803_DUPLICATE_8045_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_ceb2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_ceb2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l790_c6_4d65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_left;
     BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output := BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l819_l811_l790_l803_l806_DUPLICATE_9e23 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l819_l811_l790_l803_l806_DUPLICATE_9e23_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l806_l819_DUPLICATE_e66f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l806_l819_DUPLICATE_e66f_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l809_c30_d98d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_ins;
     sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_x;
     sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_return_output := sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l822_c31_7740] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l822_c31_7740_x <= VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_7740_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_7740_return_output := CONST_SR_8_uxn_opcodes_h_l822_c31_7740_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l790_c2_3c66_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_f55d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_f55d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l811_c11_bb83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_left;
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output := BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l790_c2_3c66_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l806_c11_30ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l807_DUPLICATE_f2e5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l807_DUPLICATE_f2e5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_ee25 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_ee25_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l819_l803_DUPLICATE_b9d2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l819_l803_DUPLICATE_b9d2_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l817_c21_7cad] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l817_c21_7cad_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_d56e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_d56e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l803_c11_1a77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_left;
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output := BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_4d65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_1a77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_30ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_bb83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_6174_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l807_DUPLICATE_f2e5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l807_DUPLICATE_f2e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l817_c21_7cad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l819_l803_DUPLICATE_b9d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l819_l803_DUPLICATE_b9d2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l819_l811_l790_l803_l806_DUPLICATE_9e23_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l819_l811_l790_l803_l806_DUPLICATE_9e23_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l819_l811_l790_l803_l806_DUPLICATE_9e23_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l819_l811_l790_l803_l806_DUPLICATE_9e23_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l819_l811_l790_l803_l806_DUPLICATE_9e23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_f55d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_f55d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_f55d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_f55d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_ee25_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_ee25_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_ee25_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_l806_l811_l803_DUPLICATE_ee25_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_d56e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_d56e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_d56e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_ceb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_ceb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l806_l811_l803_DUPLICATE_ceb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l806_l819_DUPLICATE_e66f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l806_l819_DUPLICATE_e66f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l806_l790_l803_DUPLICATE_8045_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l806_l790_l803_DUPLICATE_8045_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l806_l790_l803_DUPLICATE_8045_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l806_l790_l803_DUPLICATE_8045_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l790_c2_3c66_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l790_c2_3c66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_d98d_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_49b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l811_c7_49b0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l819_c7_aab5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c7_aab5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l808_c3_b7f0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_return_output := CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c7_aab5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l812_c3_faae] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_left;
     BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_return_output := BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l819_c7_aab5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output := result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l822_c21_4abe] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_4abe_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_7740_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c7_aab5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_faae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_4abe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b7f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l811_c7_49b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l806_c7_08c8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_08c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;

     -- t16_MUX[uxn_opcodes_h_l811_c7_49b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l811_c7_49b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_cond;
     t16_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue;
     t16_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_return_output := t16_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l819_c7_aab5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output := result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l811_c7_49b0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output := result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l811_c7_49b0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_49b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_49b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_aab5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_08c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l806_c7_08c8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output := result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;

     -- t16_MUX[uxn_opcodes_h_l806_c7_08c8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l806_c7_08c8_cond <= VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_cond;
     t16_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue;
     t16_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_return_output := t16_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l806_c7_08c8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_08c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_08c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l803_c7_c187] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l803_c7_c187] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l811_c7_49b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_c187_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_c187_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_49b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_iffalse := VAR_t16_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_c187] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_c187] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_c187] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l806_c7_08c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;

     -- t16_MUX[uxn_opcodes_h_l803_c7_c187] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l803_c7_c187_cond <= VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_cond;
     t16_MUX_uxn_opcodes_h_l803_c7_c187_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_iftrue;
     t16_MUX_uxn_opcodes_h_l803_c7_c187_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_return_output := t16_MUX_uxn_opcodes_h_l803_c7_c187_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l803_c7_c187] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_cond;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output := result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_c187] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_c187_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_c187_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_c187_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_c187_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_08c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_t16_MUX_uxn_opcodes_h_l803_c7_c187_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- t16_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     t16_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     t16_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := t16_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l803_c7_c187] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_cond;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output := result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_c187_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l790_c2_3c66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output := result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l828_l786_DUPLICATE_a416 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l828_l786_DUPLICATE_a416_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_42c1(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_3c66_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_3c66_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l828_l786_DUPLICATE_a416_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l828_l786_DUPLICATE_a416_return_output;
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
