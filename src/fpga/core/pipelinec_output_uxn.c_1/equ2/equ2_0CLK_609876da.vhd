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
-- Submodules: 58
entity equ2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_609876da;
architecture arch of equ2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1198_c6_2b7d]
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1198_c2_c983]
signal n16_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1198_c2_c983]
signal t16_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c2_c983]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c2_c983]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1198_c2_c983]
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c2_c983]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1198_c2_c983]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1198_c2_c983]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1198_c2_c983]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1198_c2_c983]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c2_c983]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1211_c11_fde2]
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1211_c7_f6d6]
signal n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1211_c7_f6d6]
signal t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1211_c7_f6d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1211_c7_f6d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1211_c7_f6d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1211_c7_f6d6]
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1211_c7_f6d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_6ffc]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1214_c7_aa3f]
signal n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1214_c7_aa3f]
signal t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_aa3f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_aa3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_aa3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1214_c7_aa3f]
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_aa3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1219_c11_2d38]
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1219_c7_6845]
signal n16_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1219_c7_6845]
signal t16_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1219_c7_6845]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1219_c7_6845]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1219_c7_6845]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1219_c7_6845]
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1219_c7_6845]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1220_c3_2360]
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1223_c11_0fb4]
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1223_c7_cfa3]
signal n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1223_c7_cfa3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1223_c7_cfa3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1223_c7_cfa3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1223_c7_cfa3]
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1223_c7_cfa3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_6e96]
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1227_c7_13f4]
signal n16_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_13f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_13f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_13f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_13f4]
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_13f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1228_c3_c6bd]
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1229_c30_39cd]
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1232_c21_6d3c]
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1232_c21_e5f5]
signal MUX_uxn_opcodes_h_l1232_c21_e5f5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_e5f5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_e5f5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_e5f5_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_left,
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_right,
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output);

-- n16_MUX_uxn_opcodes_h_l1198_c2_c983
n16_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
n16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
n16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
n16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- t16_MUX_uxn_opcodes_h_l1198_c2_c983
t16_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
t16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
t16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
t16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_left,
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_right,
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output);

-- n16_MUX_uxn_opcodes_h_l1211_c7_f6d6
n16_MUX_uxn_opcodes_h_l1211_c7_f6d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond,
n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue,
n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse,
n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output);

-- t16_MUX_uxn_opcodes_h_l1211_c7_f6d6
t16_MUX_uxn_opcodes_h_l1211_c7_f6d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond,
t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue,
t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse,
t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output);

-- n16_MUX_uxn_opcodes_h_l1214_c7_aa3f
n16_MUX_uxn_opcodes_h_l1214_c7_aa3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond,
n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue,
n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse,
n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output);

-- t16_MUX_uxn_opcodes_h_l1214_c7_aa3f
t16_MUX_uxn_opcodes_h_l1214_c7_aa3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond,
t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue,
t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse,
t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_left,
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_right,
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output);

-- n16_MUX_uxn_opcodes_h_l1219_c7_6845
n16_MUX_uxn_opcodes_h_l1219_c7_6845 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1219_c7_6845_cond,
n16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue,
n16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse,
n16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output);

-- t16_MUX_uxn_opcodes_h_l1219_c7_6845
t16_MUX_uxn_opcodes_h_l1219_c7_6845 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1219_c7_6845_cond,
t16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue,
t16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse,
t16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_cond,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360
BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_left,
BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_right,
BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_left,
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_right,
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output);

-- n16_MUX_uxn_opcodes_h_l1223_c7_cfa3
n16_MUX_uxn_opcodes_h_l1223_c7_cfa3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond,
n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue,
n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse,
n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_left,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_right,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output);

-- n16_MUX_uxn_opcodes_h_l1227_c7_13f4
n16_MUX_uxn_opcodes_h_l1227_c7_13f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1227_c7_13f4_cond,
n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue,
n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse,
n16_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd
BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_left,
BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_right,
BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd
sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_ins,
sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_x,
sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_y,
sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_left,
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_right,
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_return_output);

-- MUX_uxn_opcodes_h_l1232_c21_e5f5
MUX_uxn_opcodes_h_l1232_c21_e5f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1232_c21_e5f5_cond,
MUX_uxn_opcodes_h_l1232_c21_e5f5_iftrue,
MUX_uxn_opcodes_h_l1232_c21_e5f5_iffalse,
MUX_uxn_opcodes_h_l1232_c21_e5f5_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab
CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output,
 n16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 t16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output,
 n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output,
 t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output,
 n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output,
 t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output,
 n16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output,
 t16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output,
 n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output,
 n16_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_return_output,
 sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_return_output,
 MUX_uxn_opcodes_h_l1232_c21_e5f5_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_434a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_5117 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_894b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_af55 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_eeec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_580e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_l1198_DUPLICATE_4412_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_7c98_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_719b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_ab4a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1220_l1228_l1224_DUPLICATE_0302_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_332b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1236_l1194_DUPLICATE_055a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_580e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_580e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_5117 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_5117;
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_eeec := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_eeec;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_894b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_894b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_af55 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_af55;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_434a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_434a;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1220_l1228_l1224_DUPLICATE_0302 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1220_l1228_l1224_DUPLICATE_0302_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_c983_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_719b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_719b_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_c983_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1219_c11_2d38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_left;
     BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output := BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_c983_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_6ffc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1198_c6_2b7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1223_c11_0fb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_ab4a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_ab4a_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1229_c30_39cd] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_ins;
     sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_x;
     sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_return_output := sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1211_c11_fde2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_6e96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_left;
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output := BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_l1198_DUPLICATE_4412 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_l1198_DUPLICATE_4412_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_7c98 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_7c98_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_332b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_332b_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_c983_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b7d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_fde2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_6ffc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2d38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_0fb4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_6e96_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1220_l1228_l1224_DUPLICATE_0302_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1220_l1228_l1224_DUPLICATE_0302_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1215_l1220_l1228_l1224_DUPLICATE_0302_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_7c98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_7c98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_7c98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_7c98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_7c98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_719b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_719b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_719b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_719b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_719b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_ab4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_ab4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_ab4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_ab4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_ab4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_332b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1223_l1227_DUPLICATE_332b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_l1198_DUPLICATE_4412_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_l1198_DUPLICATE_4412_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_l1198_DUPLICATE_4412_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_l1198_DUPLICATE_4412_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_l1198_DUPLICATE_4412_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_l1198_DUPLICATE_4412_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_c983_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_c983_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_c983_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_c983_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_39cd_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1228_c3_c6bd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_left;
     BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_return_output := BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1220_c3_2360] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_left;
     BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_return_output := BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_13f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_13f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_13f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_13f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_2360_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_c6bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1225_l1216_DUPLICATE_23ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l1232_c21_6d3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1223_c7_cfa3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1219_c7_6845] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1219_c7_6845_cond <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_cond;
     t16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue;
     t16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output := t16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1223_c7_cfa3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1227_c7_13f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1227_c7_13f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_cond;
     n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue;
     n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output := n16_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1223_c7_cfa3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1223_c7_cfa3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_6d3c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;
     -- t16_MUX[uxn_opcodes_h_l1214_c7_aa3f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond;
     t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue;
     t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output := t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1219_c7_6845] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1219_c7_6845] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;

     -- MUX[uxn_opcodes_h_l1232_c21_e5f5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1232_c21_e5f5_cond <= VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_cond;
     MUX_uxn_opcodes_h_l1232_c21_e5f5_iftrue <= VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_iftrue;
     MUX_uxn_opcodes_h_l1232_c21_e5f5_iffalse <= VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_return_output := MUX_uxn_opcodes_h_l1232_c21_e5f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1219_c7_6845] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1219_c7_6845] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;

     -- n16_MUX[uxn_opcodes_h_l1223_c7_cfa3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond;
     n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue;
     n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output := n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue := VAR_MUX_uxn_opcodes_h_l1232_c21_e5f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;
     -- t16_MUX[uxn_opcodes_h_l1211_c7_f6d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond;
     t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue;
     t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output := t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_aa3f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_aa3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_aa3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_aa3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1219_c7_6845] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1219_c7_6845_cond <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_cond;
     n16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue;
     n16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output := n16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_13f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_13f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1211_c7_f6d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1211_c7_f6d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1211_c7_f6d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1223_c7_cfa3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1211_c7_f6d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1214_c7_aa3f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond;
     n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue;
     n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output := n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     t16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     t16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := t16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_cfa3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- n16_MUX[uxn_opcodes_h_l1211_c7_f6d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond;
     n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue;
     n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output := n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1219_c7_6845] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_return_output := result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_6845_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1214_c7_aa3f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     n16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     n16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := n16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_aa3f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1211_c7_f6d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_f6d6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1198_c2_c983] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_return_output := result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1236_l1194_DUPLICATE_055a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1236_l1194_DUPLICATE_055a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_c983_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1236_l1194_DUPLICATE_055a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1236_l1194_DUPLICATE_055a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
