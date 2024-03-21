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
-- BIN_OP_EQ[uxn_opcodes_h_l774_c6_0fcd]
signal BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l774_c2_b587]
signal t16_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l774_c2_b587]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l774_c2_b587]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l774_c2_b587]
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l774_c2_b587]
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l774_c2_b587]
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l774_c2_b587]
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l774_c2_b587]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l774_c2_b587]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l774_c2_b587]
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l774_c2_b587]
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l787_c11_2e66]
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l787_c7_4869]
signal t16_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l787_c7_4869]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l787_c7_4869]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l787_c7_4869]
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l787_c7_4869]
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l787_c7_4869]
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l787_c7_4869]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l787_c7_4869]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l787_c7_4869]
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l790_c11_47c0]
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l790_c7_c123]
signal t16_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c7_c123]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c7_c123]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l790_c7_c123]
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l790_c7_c123]
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l790_c7_c123]
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c7_c123]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c7_c123]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l790_c7_c123]
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l792_c3_07dd]
signal CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l793_c30_13ec]
signal sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l795_c11_ca32]
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l795_c7_63bc]
signal t16_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c7_63bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c7_63bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l795_c7_63bc]
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l795_c7_63bc]
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l795_c7_63bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c7_63bc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c7_63bc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l795_c7_63bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l796_c3_b20d]
signal BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l803_c11_42b4]
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_ef11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_ef11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_ef11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_ef11]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l803_c7_ef11]
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l803_c7_ef11]
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l806_c31_169a]
signal CONST_SR_8_uxn_opcodes_h_l806_c31_169a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l806_c31_169a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7557( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd
BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_left,
BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_right,
BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output);

-- t16_MUX_uxn_opcodes_h_l774_c2_b587
t16_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l774_c2_b587_cond,
t16_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
t16_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
t16_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587
result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_cond,
result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587
result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_cond,
result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66
BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_left,
BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_right,
BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output);

-- t16_MUX_uxn_opcodes_h_l787_c7_4869
t16_MUX_uxn_opcodes_h_l787_c7_4869 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l787_c7_4869_cond,
t16_MUX_uxn_opcodes_h_l787_c7_4869_iftrue,
t16_MUX_uxn_opcodes_h_l787_c7_4869_iffalse,
t16_MUX_uxn_opcodes_h_l787_c7_4869_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869
result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_cond,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869
result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_cond,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0
BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_left,
BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_right,
BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output);

-- t16_MUX_uxn_opcodes_h_l790_c7_c123
t16_MUX_uxn_opcodes_h_l790_c7_c123 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l790_c7_c123_cond,
t16_MUX_uxn_opcodes_h_l790_c7_c123_iftrue,
t16_MUX_uxn_opcodes_h_l790_c7_c123_iffalse,
t16_MUX_uxn_opcodes_h_l790_c7_c123_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123
result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_cond,
result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123
result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_cond,
result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_return_output);

-- CONST_SL_8_uxn_opcodes_h_l792_c3_07dd
CONST_SL_8_uxn_opcodes_h_l792_c3_07dd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_x,
CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l793_c30_13ec
sp_relative_shift_uxn_opcodes_h_l793_c30_13ec : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_ins,
sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_x,
sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_y,
sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32
BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_left,
BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_right,
BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output);

-- t16_MUX_uxn_opcodes_h_l795_c7_63bc
t16_MUX_uxn_opcodes_h_l795_c7_63bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l795_c7_63bc_cond,
t16_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue,
t16_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse,
t16_MUX_uxn_opcodes_h_l795_c7_63bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc
result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond,
result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc
result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d
BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_left,
BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_right,
BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4
BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_left,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_right,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11
result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11
result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output);

-- CONST_SR_8_uxn_opcodes_h_l806_c31_169a
CONST_SR_8_uxn_opcodes_h_l806_c31_169a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l806_c31_169a_x,
CONST_SR_8_uxn_opcodes_h_l806_c31_169a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output,
 t16_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output,
 t16_MUX_uxn_opcodes_h_l787_c7_4869_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output,
 t16_MUX_uxn_opcodes_h_l790_c7_c123_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_return_output,
 CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_return_output,
 sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output,
 t16_MUX_uxn_opcodes_h_l795_c7_63bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output,
 CONST_SR_8_uxn_opcodes_h_l806_c31_169a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_cfc4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_350b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_76f2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l798_c3_da65 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_39d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l801_c21_5bf6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l804_c3_c3ee : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_534a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_169a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_169a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l806_c21_10ad_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_bdca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_9c65_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_5850_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_7253_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4321_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_823c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_d000_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_dccd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_d202_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l812_l770_DUPLICATE_6624_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_cfc4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_cfc4;
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l798_c3_da65 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l798_c3_da65;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_534a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_534a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_350b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_350b;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l804_c3_c3ee := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l804_c3_c3ee;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_39d2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_39d2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_76f2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_76f2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_169a_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse := t16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_d202 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_d202_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_5850 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_5850_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_bdca LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_bdca_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_d000 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_d000_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l795_c11_ca32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_left;
     BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output := BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l803_c11_42b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l793_c30_13ec] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_ins;
     sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_x <= VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_x;
     sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_y <= VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_return_output := sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l774_c2_b587_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_823c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_823c_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l774_c6_0fcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l774_c2_b587_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_9c65 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_9c65_return_output := result.u8_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l801_c21_5bf6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l801_c21_5bf6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l787_c11_2e66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_left;
     BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output := BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l806_c31_169a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l806_c31_169a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_169a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_169a_return_output := CONST_SR_8_uxn_opcodes_h_l806_c31_169a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l790_c11_47c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_7253 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_7253_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_dccd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_dccd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4321 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4321_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_0fcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_2e66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_47c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_ca32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_42b4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_dccd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_dccd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l801_c21_5bf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_5850_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_5850_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_bdca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_bdca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_bdca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_bdca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_bdca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_7253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_7253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_7253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_7253_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_823c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_823c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_823c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_823c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4321_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4321_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_d000_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_d000_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_d000_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_d202_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_d202_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_9c65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_9c65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_9c65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_9c65_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l774_c2_b587_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l774_c2_b587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_13ec_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l803_c7_ef11] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output := result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l796_c3_b20d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_left;
     BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_return_output := BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c7_63bc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l792_c3_07dd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_x <= VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_return_output := CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_ef11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l806_c21_10ad] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l806_c21_10ad_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_169a_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_ef11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l795_c7_63bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_ef11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_ef11] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_b20d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l806_c21_10ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_07dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l795_c7_63bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c7_63bc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l803_c7_ef11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output := result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l795_c7_63bc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output := result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;

     -- t16_MUX[uxn_opcodes_h_l795_c7_63bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l795_c7_63bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_cond;
     t16_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue;
     t16_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_return_output := t16_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c7_63bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l790_c7_c123] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c7_c123] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c7_63bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_c123_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_c123_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_ef11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_iffalse := VAR_t16_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l795_c7_63bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c7_c123] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c7_c123] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c7_c123] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l790_c7_c123] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_cond;
     result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output := result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l787_c7_4869] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l787_c7_4869] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l790_c7_c123] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_return_output;

     -- t16_MUX[uxn_opcodes_h_l790_c7_c123] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l790_c7_c123_cond <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_cond;
     t16_MUX_uxn_opcodes_h_l790_c7_c123_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_iftrue;
     t16_MUX_uxn_opcodes_h_l790_c7_c123_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_return_output := t16_MUX_uxn_opcodes_h_l790_c7_c123_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_c123_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_c123_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_4869_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_4869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_c123_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_c123_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_63bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_iffalse := VAR_t16_MUX_uxn_opcodes_h_l790_c7_c123_return_output;
     -- t16_MUX[uxn_opcodes_h_l787_c7_4869] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l787_c7_4869_cond <= VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_cond;
     t16_MUX_uxn_opcodes_h_l787_c7_4869_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_iftrue;
     t16_MUX_uxn_opcodes_h_l787_c7_4869_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_return_output := t16_MUX_uxn_opcodes_h_l787_c7_4869_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l787_c7_4869] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l787_c7_4869] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l787_c7_4869] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_cond;
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output := result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l790_c7_c123] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_cond;
     result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output := result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l787_c7_4869] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l787_c7_4869] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_4869_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_4869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_4869_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_4869_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_c123_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_t16_MUX_uxn_opcodes_h_l787_c7_4869_return_output;
     -- t16_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     t16_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     t16_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_return_output := t16_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l787_c7_4869] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_cond;
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output := result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output := result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_4869_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l774_c2_b587_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l774_c2_b587] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_cond;
     result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output := result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l812_l770_DUPLICATE_6624 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l812_l770_DUPLICATE_6624_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7557(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_b587_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l812_l770_DUPLICATE_6624_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l812_l770_DUPLICATE_6624_return_output;
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
