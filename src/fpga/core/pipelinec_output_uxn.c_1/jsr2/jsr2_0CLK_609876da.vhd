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
-- BIN_OP_EQ[uxn_opcodes_h_l790_c6_48a5]
signal BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l790_c2_d6af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l790_c2_d6af]
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l790_c2_d6af]
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l790_c2_d6af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c2_d6af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l790_c2_d6af]
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l790_c2_d6af]
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c2_d6af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c2_d6af]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c2_d6af]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l790_c2_d6af]
signal t16_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l803_c11_f7b7]
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_bdb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l803_c7_bdb4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_bdb4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l803_c7_bdb4]
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l803_c7_bdb4]
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_bdb4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l803_c7_bdb4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_bdb4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l803_c7_bdb4]
signal t16_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l806_c11_813d]
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_4302]
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_4302]
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_4302]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l806_c7_4302]
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l806_c7_4302]
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_4302]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l806_c7_4302]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l806_c7_4302]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l806_c7_4302]
signal t16_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l808_c3_b798]
signal CONST_SL_8_uxn_opcodes_h_l808_c3_b798_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l808_c3_b798_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l809_c30_0177]
signal sp_relative_shift_uxn_opcodes_h_l809_c30_0177_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l809_c30_0177_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l809_c30_0177_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l809_c30_0177_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l811_c11_33a6]
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_97de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_97de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_97de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l811_c7_97de]
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l811_c7_97de]
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l811_c7_97de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l811_c7_97de]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l811_c7_97de]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l811_c7_97de]
signal t16_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l812_c3_417f]
signal BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l819_c11_bae9]
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l819_c7_78bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c7_78bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l819_c7_78bc]
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l819_c7_78bc]
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c7_78bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c7_78bc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l822_c31_5990]
signal CONST_SR_8_uxn_opcodes_h_l822_c31_5990_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l822_c31_5990_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_9f32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5
BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_left,
BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_right,
BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af
result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af
result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- t16_MUX_uxn_opcodes_h_l790_c2_d6af
t16_MUX_uxn_opcodes_h_l790_c2_d6af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l790_c2_d6af_cond,
t16_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue,
t16_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse,
t16_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7
BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_left,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_right,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4
result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4
result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output);

-- t16_MUX_uxn_opcodes_h_l803_c7_bdb4
t16_MUX_uxn_opcodes_h_l803_c7_bdb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l803_c7_bdb4_cond,
t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue,
t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse,
t16_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d
BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_left,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_right,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302
result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_cond,
result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302
result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_cond,
result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_return_output);

-- t16_MUX_uxn_opcodes_h_l806_c7_4302
t16_MUX_uxn_opcodes_h_l806_c7_4302 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l806_c7_4302_cond,
t16_MUX_uxn_opcodes_h_l806_c7_4302_iftrue,
t16_MUX_uxn_opcodes_h_l806_c7_4302_iffalse,
t16_MUX_uxn_opcodes_h_l806_c7_4302_return_output);

-- CONST_SL_8_uxn_opcodes_h_l808_c3_b798
CONST_SL_8_uxn_opcodes_h_l808_c3_b798 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l808_c3_b798_x,
CONST_SL_8_uxn_opcodes_h_l808_c3_b798_return_output);

-- sp_relative_shift_uxn_opcodes_h_l809_c30_0177
sp_relative_shift_uxn_opcodes_h_l809_c30_0177 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l809_c30_0177_ins,
sp_relative_shift_uxn_opcodes_h_l809_c30_0177_x,
sp_relative_shift_uxn_opcodes_h_l809_c30_0177_y,
sp_relative_shift_uxn_opcodes_h_l809_c30_0177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6
BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_left,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_right,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de
result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_cond,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de
result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_cond,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_return_output);

-- t16_MUX_uxn_opcodes_h_l811_c7_97de
t16_MUX_uxn_opcodes_h_l811_c7_97de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l811_c7_97de_cond,
t16_MUX_uxn_opcodes_h_l811_c7_97de_iftrue,
t16_MUX_uxn_opcodes_h_l811_c7_97de_iffalse,
t16_MUX_uxn_opcodes_h_l811_c7_97de_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l812_c3_417f
BIN_OP_OR_uxn_opcodes_h_l812_c3_417f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_left,
BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_right,
BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9
BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_left,
BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_right,
BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc
result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc
result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond,
result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l822_c31_5990
CONST_SR_8_uxn_opcodes_h_l822_c31_5990 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l822_c31_5990_x,
CONST_SR_8_uxn_opcodes_h_l822_c31_5990_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 t16_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output,
 t16_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_return_output,
 t16_MUX_uxn_opcodes_h_l806_c7_4302_return_output,
 CONST_SL_8_uxn_opcodes_h_l808_c3_b798_return_output,
 sp_relative_shift_uxn_opcodes_h_l809_c30_0177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_return_output,
 t16_MUX_uxn_opcodes_h_l811_c7_97de_return_output,
 BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_return_output,
 CONST_SR_8_uxn_opcodes_h_l822_c31_5990_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_7ded : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l795_c3_5317 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_4e7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b798_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b798_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_7d19 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l814_c3_99e2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l817_c21_2126_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_667a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l820_c3_d2a9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_5990_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_5990_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_a941_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l819_l790_l806_DUPLICATE_0c0b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l811_l790_l803_l819_l806_DUPLICATE_ca62_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_8645_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_878e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l803_l819_DUPLICATE_b043_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_1541_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_1eb3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l807_l812_DUPLICATE_a128_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l819_l806_DUPLICATE_4883_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l829_l786_DUPLICATE_90c2_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_7ded := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_7ded;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l795_c3_5317 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l795_c3_5317;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_7d19 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_7d19;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_4e7f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_4e7f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l820_c3_d2a9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l820_c3_d2a9;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l814_c3_99e2 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l814_c3_99e2;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_667a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_667a;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_5990_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_iffalse := t16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l790_c2_d6af_return_output := result.is_vram_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l817_c21_2126] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l817_c21_2126_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l806_c11_813d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_left;
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output := BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l819_c11_bae9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_left;
     BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output := BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l819_l790_l806_DUPLICATE_0c0b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l819_l790_l806_DUPLICATE_0c0b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l803_c11_f7b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l809_c30_0177] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l809_c30_0177_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_ins;
     sp_relative_shift_uxn_opcodes_h_l809_c30_0177_x <= VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_x;
     sp_relative_shift_uxn_opcodes_h_l809_c30_0177_y <= VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_return_output := sp_relative_shift_uxn_opcodes_h_l809_c30_0177_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_1eb3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_1eb3_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_8645 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_8645_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l807_l812_DUPLICATE_a128 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l807_l812_DUPLICATE_a128_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l811_c11_33a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l803_l819_DUPLICATE_b043 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l803_l819_DUPLICATE_b043_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l790_c2_d6af_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l811_l790_l803_l819_l806_DUPLICATE_ca62 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l811_l790_l803_l819_l806_DUPLICATE_ca62_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l819_l806_DUPLICATE_4883 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l819_l806_DUPLICATE_4883_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l790_c6_48a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l822_c31_5990] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l822_c31_5990_x <= VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_5990_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_5990_return_output := CONST_SR_8_uxn_opcodes_h_l822_c31_5990_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_878e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_878e_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_1541 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_1541_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c6_48a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_f7b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_813d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_33a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_bae9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l807_l812_DUPLICATE_a128_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b798_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l807_l812_DUPLICATE_a128_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l817_c21_2126_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l803_l819_DUPLICATE_b043_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l803_l819_DUPLICATE_b043_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l811_l790_l803_l819_l806_DUPLICATE_ca62_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l811_l790_l803_l819_l806_DUPLICATE_ca62_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l811_l790_l803_l819_l806_DUPLICATE_ca62_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l811_l790_l803_l819_l806_DUPLICATE_ca62_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l811_l790_l803_l819_l806_DUPLICATE_ca62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_8645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_8645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_8645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_8645_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_1eb3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_1eb3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_1eb3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l803_l811_l819_l806_DUPLICATE_1eb3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_1541_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_1541_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_1541_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_878e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_878e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l803_l811_l806_DUPLICATE_878e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l819_l806_DUPLICATE_4883_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l819_l806_DUPLICATE_4883_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l819_l790_l806_DUPLICATE_0c0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l819_l790_l806_DUPLICATE_0c0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l819_l790_l806_DUPLICATE_0c0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l819_l790_l806_DUPLICATE_0c0b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l790_c2_d6af_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l790_c2_d6af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l809_c30_0177_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l808_c3_b798] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l808_c3_b798_x <= VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b798_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b798_return_output := CONST_SL_8_uxn_opcodes_h_l808_c3_b798_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l822_c21_a941] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_a941_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c31_5990_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c7_78bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l819_c7_78bc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output := result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l812_c3_417f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_left;
     BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_return_output := BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c7_78bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l819_c7_78bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l811_c7_97de] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_97de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c7_78bc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l812_c3_417f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_a941_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l808_c3_b798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_97de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_97de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l806_c7_4302] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l819_c7_78bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;

     -- t16_MUX[uxn_opcodes_h_l811_c7_97de] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l811_c7_97de_cond <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_cond;
     t16_MUX_uxn_opcodes_h_l811_c7_97de_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_iftrue;
     t16_MUX_uxn_opcodes_h_l811_c7_97de_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_return_output := t16_MUX_uxn_opcodes_h_l811_c7_97de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_97de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l811_c7_97de] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_cond;
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output := result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l811_c7_97de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l811_c7_97de] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_4302] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_97de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_97de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_97de_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l806_c7_4302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_4302_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_97de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_97de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c7_78bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_iffalse := VAR_t16_MUX_uxn_opcodes_h_l811_c7_97de_return_output;
     -- t16_MUX[uxn_opcodes_h_l806_c7_4302] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l806_c7_4302_cond <= VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_cond;
     t16_MUX_uxn_opcodes_h_l806_c7_4302_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_iftrue;
     t16_MUX_uxn_opcodes_h_l806_c7_4302_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_return_output := t16_MUX_uxn_opcodes_h_l806_c7_4302_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l806_c7_4302] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_cond;
     result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output := result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_4302] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l803_c7_bdb4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_4302] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_4302] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l811_c7_97de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output := result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l803_c7_bdb4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l806_c7_4302] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_4302_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_4302_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_4302_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_4302_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_97de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l806_c7_4302_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_bdb4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;

     -- t16_MUX[uxn_opcodes_h_l803_c7_bdb4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l803_c7_bdb4_cond <= VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_cond;
     t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue;
     t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output := t16_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_bdb4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_bdb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_bdb4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l803_c7_bdb4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output := result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l806_c7_4302] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_cond;
     result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output := result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l806_c7_4302_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_t16_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l803_c7_bdb4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output := result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- t16_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     t16_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     t16_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := t16_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_bdb4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l790_c2_d6af] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_cond;
     result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output := result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l829_l786_DUPLICATE_90c2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l829_l786_DUPLICATE_90c2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9f32(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c2_d6af_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c2_d6af_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l829_l786_DUPLICATE_90c2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l829_l786_DUPLICATE_90c2_return_output;
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
