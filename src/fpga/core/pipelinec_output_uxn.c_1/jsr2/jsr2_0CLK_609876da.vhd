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
-- BIN_OP_EQ[uxn_opcodes_h_l774_c6_a4b5]
signal BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l774_c2_3060]
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l774_c2_3060]
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l774_c2_3060]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l774_c2_3060]
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l774_c2_3060]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l774_c2_3060]
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l774_c2_3060]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l774_c2_3060]
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l774_c2_3060]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l774_c2_3060]
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l774_c2_3060]
signal t16_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l787_c11_5271]
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l787_c7_92ec]
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l787_c7_92ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l787_c7_92ec]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l787_c7_92ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l787_c7_92ec]
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l787_c7_92ec]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l787_c7_92ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l787_c7_92ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l787_c7_92ec]
signal t16_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l790_c11_781b]
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l790_c7_4005]
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l790_c7_4005]
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c7_4005]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c7_4005]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l790_c7_4005]
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c7_4005]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c7_4005]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l790_c7_4005]
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l790_c7_4005]
signal t16_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l792_c3_7810]
signal CONST_SL_8_uxn_opcodes_h_l792_c3_7810_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l792_c3_7810_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l793_c30_5bf9]
signal sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l795_c11_515f]
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l795_c7_852b]
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l795_c7_852b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c7_852b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c7_852b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l795_c7_852b]
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c7_852b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c7_852b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l795_c7_852b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l795_c7_852b]
signal t16_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l796_c3_5f27]
signal BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l803_c11_0730]
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l803_c7_f577]
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_f577]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l803_c7_f577]
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_f577]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_f577]
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_f577]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l806_c31_5f07]
signal CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5
BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_left,
BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_right,
BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060
result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_cond,
result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060
result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_cond,
result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- t16_MUX_uxn_opcodes_h_l774_c2_3060
t16_MUX_uxn_opcodes_h_l774_c2_3060 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l774_c2_3060_cond,
t16_MUX_uxn_opcodes_h_l774_c2_3060_iftrue,
t16_MUX_uxn_opcodes_h_l774_c2_3060_iffalse,
t16_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271
BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_left,
BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_right,
BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec
result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec
result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_return_output);

-- t16_MUX_uxn_opcodes_h_l787_c7_92ec
t16_MUX_uxn_opcodes_h_l787_c7_92ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l787_c7_92ec_cond,
t16_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue,
t16_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse,
t16_MUX_uxn_opcodes_h_l787_c7_92ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b
BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_left,
BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_right,
BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005
result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_cond,
result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005
result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_cond,
result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_return_output);

-- t16_MUX_uxn_opcodes_h_l790_c7_4005
t16_MUX_uxn_opcodes_h_l790_c7_4005 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l790_c7_4005_cond,
t16_MUX_uxn_opcodes_h_l790_c7_4005_iftrue,
t16_MUX_uxn_opcodes_h_l790_c7_4005_iffalse,
t16_MUX_uxn_opcodes_h_l790_c7_4005_return_output);

-- CONST_SL_8_uxn_opcodes_h_l792_c3_7810
CONST_SL_8_uxn_opcodes_h_l792_c3_7810 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l792_c3_7810_x,
CONST_SL_8_uxn_opcodes_h_l792_c3_7810_return_output);

-- sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9
sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_ins,
sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_x,
sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_y,
sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f
BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_left,
BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_right,
BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b
result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_cond,
result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b
result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_cond,
result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_return_output);

-- t16_MUX_uxn_opcodes_h_l795_c7_852b
t16_MUX_uxn_opcodes_h_l795_c7_852b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l795_c7_852b_cond,
t16_MUX_uxn_opcodes_h_l795_c7_852b_iftrue,
t16_MUX_uxn_opcodes_h_l795_c7_852b_iffalse,
t16_MUX_uxn_opcodes_h_l795_c7_852b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27
BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_left,
BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_right,
BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730
BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_left,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_right,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577
result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_cond,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577
result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_cond,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_return_output);

-- CONST_SR_8_uxn_opcodes_h_l806_c31_5f07
CONST_SR_8_uxn_opcodes_h_l806_c31_5f07 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_x,
CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 t16_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_return_output,
 t16_MUX_uxn_opcodes_h_l787_c7_92ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_return_output,
 t16_MUX_uxn_opcodes_h_l790_c7_4005_return_output,
 CONST_SL_8_uxn_opcodes_h_l792_c3_7810_return_output,
 sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_return_output,
 t16_MUX_uxn_opcodes_h_l795_c7_852b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_return_output,
 CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_2ee8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_8acc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_f19f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_7810_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_7810_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_5ae5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l798_c3_352b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l801_c21_025e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_4ba5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l804_c3_6dc5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l806_c21_4634_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l787_l774_l790_DUPLICATE_4410_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l774_l803_l795_l790_l787_DUPLICATE_1661_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_fd3a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_27e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_a10c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_8668_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_3f6c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_6494_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_2b05_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l812_l770_DUPLICATE_1040_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l804_c3_6dc5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l804_c3_6dc5;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_5ae5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_5ae5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_f19f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_f19f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_4ba5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_4ba5;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_8acc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_8acc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_2ee8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_2ee8;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l798_c3_352b := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l798_c3_352b;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_iffalse := t16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l774_c2_3060_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_6494 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_6494_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l787_c11_5271] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_left;
     BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output := BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_8668 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_8668_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l774_c2_3060_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_a10c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_a10c_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l795_c11_515f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_left;
     BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output := BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l774_c6_a4b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l774_l803_l795_l790_l787_DUPLICATE_1661 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l774_l803_l795_l790_l787_DUPLICATE_1661_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l787_l774_l790_DUPLICATE_4410 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l787_l774_l790_DUPLICATE_4410_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l803_c11_0730] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_left;
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output := BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_3f6c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_3f6c_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l801_c21_025e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l801_c21_025e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_2b05 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_2b05_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_fd3a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_fd3a_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l793_c30_5bf9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_ins;
     sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_x;
     sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_return_output := sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l806_c31_5f07] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_x <= VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_return_output := CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_27e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_27e5_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l790_c11_781b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_left;
     BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output := BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_a4b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_5271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_781b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_515f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0730_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_6494_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_7810_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_6494_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l801_c21_025e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_8668_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_8668_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l774_l803_l795_l790_l787_DUPLICATE_1661_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l774_l803_l795_l790_l787_DUPLICATE_1661_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l774_l803_l795_l790_l787_DUPLICATE_1661_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l774_l803_l795_l790_l787_DUPLICATE_1661_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l774_l803_l795_l790_l787_DUPLICATE_1661_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_3f6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_3f6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_3f6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_3f6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_a10c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_a10c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_a10c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l795_l787_l803_l790_DUPLICATE_a10c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_27e5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_27e5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_27e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_fd3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_fd3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l795_l787_l790_DUPLICATE_fd3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_2b05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_2b05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l787_l774_l790_DUPLICATE_4410_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l787_l774_l790_DUPLICATE_4410_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l787_l774_l790_DUPLICATE_4410_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l803_l787_l774_l790_DUPLICATE_4410_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l774_c2_3060_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l774_c2_3060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_5bf9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_f577] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_f577] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l806_c21_4634] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l806_c21_4634_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5f07_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l803_c7_f577] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_cond;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output := result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_f577] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c7_852b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l795_c7_852b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_f577] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l792_c3_7810] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l792_c3_7810_x <= VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_7810_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_7810_return_output := CONST_SL_8_uxn_opcodes_h_l792_c3_7810_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l796_c3_5f27] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_left;
     BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_return_output := BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_5f27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l806_c21_4634_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_7810_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_f577_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_f577_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_852b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_852b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_f577_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_f577_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c7_852b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c7_852b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l803_c7_f577] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_cond;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output := result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l790_c7_4005] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l795_c7_852b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output := result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output;

     -- t16_MUX[uxn_opcodes_h_l795_c7_852b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l795_c7_852b_cond <= VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_cond;
     t16_MUX_uxn_opcodes_h_l795_c7_852b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_iftrue;
     t16_MUX_uxn_opcodes_h_l795_c7_852b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_return_output := t16_MUX_uxn_opcodes_h_l795_c7_852b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c7_852b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l795_c7_852b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c7_4005] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_852b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_852b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_4005_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_4005_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_852b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_852b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_f577_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_iffalse := VAR_t16_MUX_uxn_opcodes_h_l795_c7_852b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c7_4005] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_return_output;

     -- t16_MUX[uxn_opcodes_h_l790_c7_4005] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l790_c7_4005_cond <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_cond;
     t16_MUX_uxn_opcodes_h_l790_c7_4005_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_iftrue;
     t16_MUX_uxn_opcodes_h_l790_c7_4005_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_return_output := t16_MUX_uxn_opcodes_h_l790_c7_4005_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l787_c7_92ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l795_c7_852b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output := result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l790_c7_4005] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_cond;
     result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output := result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l790_c7_4005] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c7_4005] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l787_c7_92ec] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c7_4005] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_4005_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_4005_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_4005_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_4005_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_852b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l790_c7_4005_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l787_c7_92ec] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond;
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output := result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l790_c7_4005] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_cond;
     result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output := result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l787_c7_92ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;

     -- t16_MUX[uxn_opcodes_h_l787_c7_92ec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l787_c7_92ec_cond <= VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_cond;
     t16_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue;
     t16_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_return_output := t16_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l787_c7_92ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l787_c7_92ec] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l787_c7_92ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_4005_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_t16_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l787_c7_92ec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output := result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- t16_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     t16_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     t16_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_return_output := t16_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output := result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_92ec_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l774_c2_3060_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l774_c2_3060] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_cond;
     result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output := result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l812_l770_DUPLICATE_1040 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l812_l770_DUPLICATE_1040_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_3060_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_3060_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l812_l770_DUPLICATE_1040_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l812_l770_DUPLICATE_1040_return_output;
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
