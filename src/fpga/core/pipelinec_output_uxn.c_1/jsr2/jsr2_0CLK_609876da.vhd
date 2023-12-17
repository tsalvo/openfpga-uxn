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
-- BIN_OP_EQ[uxn_opcodes_h_l795_c6_f67a]
signal BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l795_c2_9e14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l795_c2_9e14]
signal result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c2_9e14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l795_c2_9e14]
signal result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l795_c2_9e14]
signal result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c2_9e14]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c2_9e14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l795_c2_9e14]
signal result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c2_9e14]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l795_c2_9e14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l795_c2_9e14]
signal t16_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l808_c11_3c27]
signal BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l808_c7_b2fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l808_c7_b2fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l808_c7_b2fe]
signal result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l808_c7_b2fe]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l808_c7_b2fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l808_c7_b2fe]
signal result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l808_c7_b2fe]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l808_c7_b2fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l808_c7_b2fe]
signal t16_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l811_c11_a60d]
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_741c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l811_c7_741c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l811_c7_741c]
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l811_c7_741c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_741c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l811_c7_741c]
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l811_c7_741c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_741c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l811_c7_741c]
signal t16_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l813_c3_0c4b]
signal CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l814_c30_b5ed]
signal sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l816_c11_3925]
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_8381]
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l816_c7_8381]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l816_c7_8381]
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l816_c7_8381]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_8381]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l816_c7_8381]
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l816_c7_8381]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_8381]
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l816_c7_8381]
signal t16_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l817_c3_df70]
signal BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l824_c11_11c7]
signal BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l824_c7_2352]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l824_c7_2352]
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l824_c7_2352]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l824_c7_2352]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l824_c7_2352]
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l824_c7_2352]
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l827_c31_3b38]
signal CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a
BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_left,
BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_right,
BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14
result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14
result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14
result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14
result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- t16_MUX_uxn_opcodes_h_l795_c2_9e14
t16_MUX_uxn_opcodes_h_l795_c2_9e14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l795_c2_9e14_cond,
t16_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue,
t16_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse,
t16_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27
BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_left,
BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_right,
BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe
result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe
result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond,
result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output);

-- t16_MUX_uxn_opcodes_h_l808_c7_b2fe
t16_MUX_uxn_opcodes_h_l808_c7_b2fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l808_c7_b2fe_cond,
t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue,
t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse,
t16_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d
BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_left,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_right,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c
result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_cond,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c
result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_cond,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_return_output);

-- t16_MUX_uxn_opcodes_h_l811_c7_741c
t16_MUX_uxn_opcodes_h_l811_c7_741c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l811_c7_741c_cond,
t16_MUX_uxn_opcodes_h_l811_c7_741c_iftrue,
t16_MUX_uxn_opcodes_h_l811_c7_741c_iffalse,
t16_MUX_uxn_opcodes_h_l811_c7_741c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b
CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_x,
CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed
sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_ins,
sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_x,
sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_y,
sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925
BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_left,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_right,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381
result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_cond,
result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381
result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_cond,
result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_return_output);

-- t16_MUX_uxn_opcodes_h_l816_c7_8381
t16_MUX_uxn_opcodes_h_l816_c7_8381 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l816_c7_8381_cond,
t16_MUX_uxn_opcodes_h_l816_c7_8381_iftrue,
t16_MUX_uxn_opcodes_h_l816_c7_8381_iffalse,
t16_MUX_uxn_opcodes_h_l816_c7_8381_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l817_c3_df70
BIN_OP_OR_uxn_opcodes_h_l817_c3_df70 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_left,
BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_right,
BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7
BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_left,
BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_right,
BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352
result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_cond,
result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352
result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_cond,
result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output);

-- CONST_SR_8_uxn_opcodes_h_l827_c31_3b38
CONST_SR_8_uxn_opcodes_h_l827_c31_3b38 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_x,
CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 t16_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output,
 t16_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_return_output,
 t16_MUX_uxn_opcodes_h_l811_c7_741c_return_output,
 CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_return_output,
 sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_return_output,
 t16_MUX_uxn_opcodes_h_l816_c7_8381_return_output,
 BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output,
 CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l800_c3_c68d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_3add : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l809_c3_5c84 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l819_c3_02d3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_e3ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_0298_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l826_c3_e83d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l825_c3_e11d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l827_c21_d50d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l795_l808_l824_l811_DUPLICATE_819f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l808_l795_DUPLICATE_4b35_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_6669_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l824_DUPLICATE_7242_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_af25_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_901a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_a608_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l817_DUPLICATE_1b00_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l824_l811_DUPLICATE_0829_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l834_l791_DUPLICATE_8140_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l819_c3_02d3 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l819_c3_02d3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_3add := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_3add;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l825_c3_e11d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l825_c3_e11d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l826_c3_e83d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l826_c3_e83d;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l809_c3_5c84 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l809_c3_5c84;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l800_c3_c68d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l800_c3_c68d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_e3ee := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_e3ee;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l795_c6_f67a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_left;
     BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output := BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l814_c30_b5ed] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_ins;
     sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_x <= VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_x;
     sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_y <= VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_return_output := sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l808_c11_3c27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_left;
     BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output := BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_a608 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_a608_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_901a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_901a_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l824_c11_11c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l811_c11_a60d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_left;
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output := BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l795_c2_9e14_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l795_c2_9e14_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l824_DUPLICATE_7242 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l824_DUPLICATE_7242_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l816_c11_3925] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_left;
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output := BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l822_c21_0298] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_0298_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_af25 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_af25_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l827_c31_3b38] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_x <= VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_return_output := CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l817_DUPLICATE_1b00 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l817_DUPLICATE_1b00_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l808_l795_DUPLICATE_4b35 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l808_l795_DUPLICATE_4b35_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l795_l808_l824_l811_DUPLICATE_819f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l795_l808_l824_l811_DUPLICATE_819f_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_6669 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_6669_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l824_l811_DUPLICATE_0829 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l824_l811_DUPLICATE_0829_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_f67a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_3c27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_a60d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_3925_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_11c7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l817_DUPLICATE_1b00_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l817_DUPLICATE_1b00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_0298_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l824_DUPLICATE_7242_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l824_DUPLICATE_7242_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l808_l795_DUPLICATE_4b35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l808_l795_DUPLICATE_4b35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l808_l795_DUPLICATE_4b35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l808_l795_DUPLICATE_4b35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l808_l795_DUPLICATE_4b35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_a608_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_a608_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_a608_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_a608_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_901a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_901a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_901a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l808_l824_l811_DUPLICATE_901a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_af25_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_af25_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_af25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_6669_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_6669_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l808_l811_DUPLICATE_6669_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l824_l811_DUPLICATE_0829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l824_l811_DUPLICATE_0829_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l795_l808_l824_l811_DUPLICATE_819f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l795_l808_l824_l811_DUPLICATE_819f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l795_l808_l824_l811_DUPLICATE_819f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l795_l808_l824_l811_DUPLICATE_819f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l795_c2_9e14_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l795_c2_9e14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_b5ed_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l824_c7_2352] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l813_c3_0c4b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_return_output := CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l824_c7_2352] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_cond;
     result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output := result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l824_c7_2352] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l824_c7_2352] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l817_c3_df70] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_left;
     BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_return_output := BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l824_c7_2352] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l827_c21_d50d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l827_c21_d50d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_3b38_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l816_c7_8381] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_8381] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_df70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l827_c21_d50d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_0c4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_2352_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_2352_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_8381_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_8381_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_2352_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_2352_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output;
     -- t16_MUX[uxn_opcodes_h_l816_c7_8381] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l816_c7_8381_cond <= VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_cond;
     t16_MUX_uxn_opcodes_h_l816_c7_8381_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_iftrue;
     t16_MUX_uxn_opcodes_h_l816_c7_8381_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_return_output := t16_MUX_uxn_opcodes_h_l816_c7_8381_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l816_c7_8381] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_8381] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l816_c7_8381] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_cond;
     result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output := result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l816_c7_8381] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l811_c7_741c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_741c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_8381] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l824_c7_2352] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_cond;
     result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output := result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_8381_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_8381_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_741c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_741c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_8381_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_8381_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_2352_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l816_c7_8381_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_741c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_return_output;

     -- t16_MUX[uxn_opcodes_h_l811_c7_741c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l811_c7_741c_cond <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_cond;
     t16_MUX_uxn_opcodes_h_l811_c7_741c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_iftrue;
     t16_MUX_uxn_opcodes_h_l811_c7_741c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_return_output := t16_MUX_uxn_opcodes_h_l811_c7_741c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l811_c7_741c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l808_c7_b2fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l808_c7_b2fe] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l811_c7_741c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output := result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l811_c7_741c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l816_c7_8381] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_cond;
     result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output := result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_741c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_741c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_741c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_741c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_741c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_8381_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l811_c7_741c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l811_c7_741c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output := result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l808_c7_b2fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l808_c7_b2fe] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l808_c7_b2fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l808_c7_b2fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;

     -- t16_MUX[uxn_opcodes_h_l808_c7_b2fe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l808_c7_b2fe_cond <= VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_cond;
     t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue;
     t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output := t16_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l808_c7_b2fe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output := result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_741c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_t16_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- t16_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     t16_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     t16_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := t16_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l808_c7_b2fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_b2fe_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l795_c2_9e14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output := result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l834_l791_DUPLICATE_8140 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l834_l791_DUPLICATE_8140_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_9e14_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_9e14_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l834_l791_DUPLICATE_8140_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l834_l791_DUPLICATE_8140_return_output;
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
