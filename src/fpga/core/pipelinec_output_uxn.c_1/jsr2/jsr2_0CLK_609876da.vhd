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
-- BIN_OP_EQ[uxn_opcodes_h_l795_c6_1564]
signal BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l795_c2_2752]
signal t16_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l795_c2_2752]
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c2_2752]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l795_c2_2752]
signal result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l795_c2_2752]
signal result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l795_c2_2752]
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c2_2752]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l795_c2_2752]
signal result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l795_c2_2752]
signal result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c2_2752]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c2_2752]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l808_c11_86bd]
signal BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l808_c7_14a7]
signal t16_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l808_c7_14a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l808_c7_14a7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l808_c7_14a7]
signal result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l808_c7_14a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l808_c7_14a7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l808_c7_14a7]
signal result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l808_c7_14a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l808_c7_14a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l811_c11_ddf1]
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l811_c7_9478]
signal t16_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_9478]
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l811_c7_9478]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l811_c7_9478]
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l811_c7_9478]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l811_c7_9478]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l811_c7_9478]
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_9478]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_9478]
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l813_c3_bb2c]
signal CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l814_c30_cc06]
signal sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l816_c11_1100]
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l816_c7_a222]
signal t16_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_a222]
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l816_c7_a222]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l816_c7_a222]
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l816_c7_a222]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l816_c7_a222]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l816_c7_a222]
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_a222]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_a222]
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l817_c3_09ad]
signal BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l824_c11_adc9]
signal BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l824_c7_7598]
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l824_c7_7598]
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l824_c7_7598]
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l824_c7_7598]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l824_c7_7598]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l824_c7_7598]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l827_c31_0588]
signal CONST_SR_8_uxn_opcodes_h_l827_c31_0588_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l827_c31_0588_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a75( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564
BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_left,
BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_right,
BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output);

-- t16_MUX_uxn_opcodes_h_l795_c2_2752
t16_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l795_c2_2752_cond,
t16_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
t16_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
t16_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752
result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_cond,
result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752
result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752
result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752
result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_cond,
result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd
BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_left,
BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_right,
BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output);

-- t16_MUX_uxn_opcodes_h_l808_c7_14a7
t16_MUX_uxn_opcodes_h_l808_c7_14a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l808_c7_14a7_cond,
t16_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue,
t16_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse,
t16_MUX_uxn_opcodes_h_l808_c7_14a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7
result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond,
result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7
result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1
BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_left,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_right,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output);

-- t16_MUX_uxn_opcodes_h_l811_c7_9478
t16_MUX_uxn_opcodes_h_l811_c7_9478 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l811_c7_9478_cond,
t16_MUX_uxn_opcodes_h_l811_c7_9478_iftrue,
t16_MUX_uxn_opcodes_h_l811_c7_9478_iffalse,
t16_MUX_uxn_opcodes_h_l811_c7_9478_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478
result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_cond,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478
result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_cond,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_return_output);

-- CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c
CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_x,
CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l814_c30_cc06
sp_relative_shift_uxn_opcodes_h_l814_c30_cc06 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_ins,
sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_x,
sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_y,
sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100
BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_left,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_right,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output);

-- t16_MUX_uxn_opcodes_h_l816_c7_a222
t16_MUX_uxn_opcodes_h_l816_c7_a222 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l816_c7_a222_cond,
t16_MUX_uxn_opcodes_h_l816_c7_a222_iftrue,
t16_MUX_uxn_opcodes_h_l816_c7_a222_iffalse,
t16_MUX_uxn_opcodes_h_l816_c7_a222_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222
result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_cond,
result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222
result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_cond,
result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad
BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_left,
BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_right,
BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9
BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_left,
BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_right,
BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598
result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_cond,
result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598
result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_cond,
result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_return_output);

-- CONST_SR_8_uxn_opcodes_h_l827_c31_0588
CONST_SR_8_uxn_opcodes_h_l827_c31_0588 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l827_c31_0588_x,
CONST_SR_8_uxn_opcodes_h_l827_c31_0588_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output,
 t16_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output,
 t16_MUX_uxn_opcodes_h_l808_c7_14a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output,
 t16_MUX_uxn_opcodes_h_l811_c7_9478_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_return_output,
 CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_return_output,
 sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output,
 t16_MUX_uxn_opcodes_h_l816_c7_a222_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_return_output,
 BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_return_output,
 CONST_SR_8_uxn_opcodes_h_l827_c31_0588_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l800_c3_cb4a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_7dfc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l809_c3_382c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l819_c3_213f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_566d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_e0b9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l825_c3_796e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l826_c3_0def : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_0588_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_0588_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l827_c21_f7b6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l795_l808_DUPLICATE_8ead_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l824_l811_l795_DUPLICATE_a15f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_9bf6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_c376_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l824_DUPLICATE_e87b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_dcb0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_ce12_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l817_DUPLICATE_2a4c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l811_l824_DUPLICATE_494f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l834_l791_DUPLICATE_a74c_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l800_c3_cb4a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l800_c3_cb4a;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l825_c3_796e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l825_c3_796e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l826_c3_0def := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l826_c3_0def;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_566d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_566d;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l819_c3_213f := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l819_c3_213f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_7dfc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_7dfc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l809_c3_382c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l809_c3_382c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_0588_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_iffalse := t16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l811_l824_DUPLICATE_494f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l811_l824_DUPLICATE_494f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_dcb0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_dcb0_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_ce12 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_ce12_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l827_c31_0588] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l827_c31_0588_x <= VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_0588_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_0588_return_output := CONST_SR_8_uxn_opcodes_h_l827_c31_0588_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l811_c11_ddf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_left;
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output := BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l795_c2_2752_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l808_c11_86bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l795_l808_DUPLICATE_8ead LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l795_l808_DUPLICATE_8ead_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_c376 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_c376_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l814_c30_cc06] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_ins;
     sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_x <= VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_x;
     sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_y <= VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_return_output := sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l795_c2_2752_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l824_DUPLICATE_e87b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l824_DUPLICATE_e87b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l816_c11_1100] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_left;
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output := BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l817_DUPLICATE_2a4c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l817_DUPLICATE_2a4c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_9bf6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_9bf6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l824_c11_adc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l824_l811_l795_DUPLICATE_a15f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l824_l811_l795_DUPLICATE_a15f_return_output := result.u8_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l822_c21_e0b9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_e0b9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l795_c6_1564] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_left;
     BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output := BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_86bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_ddf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_1100_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_adc9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l817_DUPLICATE_2a4c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l812_l817_DUPLICATE_2a4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c21_e0b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l824_DUPLICATE_e87b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l824_DUPLICATE_e87b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l795_l808_DUPLICATE_8ead_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l795_l808_DUPLICATE_8ead_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l795_l808_DUPLICATE_8ead_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l795_l808_DUPLICATE_8ead_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l824_l816_l811_l795_l808_DUPLICATE_8ead_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_9bf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_9bf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_9bf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_9bf6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_dcb0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_dcb0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_dcb0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l808_l816_l824_l811_DUPLICATE_dcb0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_c376_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_c376_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_c376_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_ce12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_ce12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l816_l811_DUPLICATE_ce12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l811_l824_DUPLICATE_494f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l811_l824_DUPLICATE_494f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l824_l811_l795_DUPLICATE_a15f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l824_l811_l795_DUPLICATE_a15f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l824_l811_l795_DUPLICATE_a15f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l824_l811_l795_DUPLICATE_a15f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l795_c2_2752_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l795_c2_2752_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l814_c30_cc06_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_a222] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l824_c7_7598] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l817_c3_09ad] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_left;
     BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_return_output := BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l824_c7_7598] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l824_c7_7598] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l827_c21_f7b6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l827_c21_f7b6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l827_c31_0588_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l824_c7_7598] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l824_c7_7598] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_cond;
     result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output := result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l813_c3_bb2c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_return_output := CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l816_c7_a222] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l817_c3_09ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l827_c21_f7b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l813_c3_bb2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_7598_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_7598_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_a222_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_a222_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_7598_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_7598_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_9478] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_a222] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_return_output;

     -- t16_MUX[uxn_opcodes_h_l816_c7_a222] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l816_c7_a222_cond <= VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_cond;
     t16_MUX_uxn_opcodes_h_l816_c7_a222_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_iftrue;
     t16_MUX_uxn_opcodes_h_l816_c7_a222_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_return_output := t16_MUX_uxn_opcodes_h_l816_c7_a222_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l824_c7_7598] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_cond;
     result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output := result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_a222] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l816_c7_a222] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l811_c7_9478] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l816_c7_a222] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l816_c7_a222] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_cond;
     result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output := result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_a222_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_a222_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l811_c7_9478_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_9478_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_a222_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_a222_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_7598_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_iffalse := VAR_t16_MUX_uxn_opcodes_h_l816_c7_a222_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_9478] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l808_c7_14a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l808_c7_14a7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l816_c7_a222] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_cond;
     result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output := result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_9478] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l811_c7_9478] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l811_c7_9478] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l811_c7_9478] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_cond;
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output := result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output;

     -- t16_MUX[uxn_opcodes_h_l811_c7_9478] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l811_c7_9478_cond <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_cond;
     t16_MUX_uxn_opcodes_h_l811_c7_9478_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_iftrue;
     t16_MUX_uxn_opcodes_h_l811_c7_9478_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_return_output := t16_MUX_uxn_opcodes_h_l811_c7_9478_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_9478_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l811_c7_9478_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l811_c7_9478_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_9478_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_a222_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l811_c7_9478_return_output;
     -- t16_MUX[uxn_opcodes_h_l808_c7_14a7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l808_c7_14a7_cond <= VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_cond;
     t16_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue;
     t16_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_return_output := t16_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l808_c7_14a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l808_c7_14a7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output := result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l808_c7_14a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l808_c7_14a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l811_c7_9478] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_cond;
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output := result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l808_c7_14a7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l811_c7_9478_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_t16_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;
     -- t16_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     t16_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     t16_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_return_output := t16_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l808_c7_14a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output := result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c7_14a7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l795_c2_2752_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l795_c2_2752] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_cond;
     result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output := result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l834_l791_DUPLICATE_a74c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l834_l791_DUPLICATE_a74c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a75(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_2752_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_2752_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l834_l791_DUPLICATE_a74c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l834_l791_DUPLICATE_a74c_return_output;
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
