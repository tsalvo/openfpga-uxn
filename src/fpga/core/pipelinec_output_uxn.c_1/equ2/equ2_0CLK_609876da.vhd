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
-- BIN_OP_EQ[uxn_opcodes_h_l1214_c6_3569]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal n16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1214_c2_cc76]
signal t16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_73c9]
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1227_c7_17fe]
signal n16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_17fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_17fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_17fe]
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_17fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_17fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1227_c7_17fe]
signal t16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1230_c11_8ec4]
signal BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1230_c7_41fa]
signal n16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1230_c7_41fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1230_c7_41fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1230_c7_41fa]
signal result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1230_c7_41fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1230_c7_41fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1230_c7_41fa]
signal t16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1235_c11_f741]
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1235_c7_e26d]
signal n16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1235_c7_e26d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1235_c7_e26d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1235_c7_e26d]
signal result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1235_c7_e26d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1235_c7_e26d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1235_c7_e26d]
signal t16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1236_c3_b8f2]
signal BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1239_c11_aab8]
signal BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1239_c7_ad48]
signal n16_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1239_c7_ad48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1239_c7_ad48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1239_c7_ad48]
signal result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1239_c7_ad48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1239_c7_ad48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1243_c11_77a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1243_c7_3190]
signal n16_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1243_c7_3190]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1243_c7_3190]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1243_c7_3190]
signal result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1243_c7_3190]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1243_c7_3190]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1244_c3_f8c1]
signal BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1245_c30_3760]
signal sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1248_c21_b75a]
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1248_c21_961d]
signal MUX_uxn_opcodes_h_l1248_c21_961d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1248_c21_961d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1248_c21_961d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1248_c21_961d_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569
BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output);

-- n16_MUX_uxn_opcodes_h_l1214_c2_cc76
n16_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
n16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76
result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76
result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76
result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76
result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- t16_MUX_uxn_opcodes_h_l1214_c2_cc76
t16_MUX_uxn_opcodes_h_l1214_c2_cc76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond,
t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue,
t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse,
t16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_left,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_right,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output);

-- n16_MUX_uxn_opcodes_h_l1227_c7_17fe
n16_MUX_uxn_opcodes_h_l1227_c7_17fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond,
n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue,
n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse,
n16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output);

-- t16_MUX_uxn_opcodes_h_l1227_c7_17fe
t16_MUX_uxn_opcodes_h_l1227_c7_17fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond,
t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue,
t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse,
t16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_left,
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_right,
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output);

-- n16_MUX_uxn_opcodes_h_l1230_c7_41fa
n16_MUX_uxn_opcodes_h_l1230_c7_41fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond,
n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue,
n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse,
n16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa
result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output);

-- t16_MUX_uxn_opcodes_h_l1230_c7_41fa
t16_MUX_uxn_opcodes_h_l1230_c7_41fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond,
t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue,
t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse,
t16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_left,
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_right,
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output);

-- n16_MUX_uxn_opcodes_h_l1235_c7_e26d
n16_MUX_uxn_opcodes_h_l1235_c7_e26d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond,
n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue,
n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse,
n16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d
result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output);

-- t16_MUX_uxn_opcodes_h_l1235_c7_e26d
t16_MUX_uxn_opcodes_h_l1235_c7_e26d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond,
t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue,
t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse,
t16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2
BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_left,
BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_right,
BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8
BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_left,
BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_right,
BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output);

-- n16_MUX_uxn_opcodes_h_l1239_c7_ad48
n16_MUX_uxn_opcodes_h_l1239_c7_ad48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1239_c7_ad48_cond,
n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue,
n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse,
n16_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48
result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48
result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48
result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_cond,
result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48
result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output);

-- n16_MUX_uxn_opcodes_h_l1243_c7_3190
n16_MUX_uxn_opcodes_h_l1243_c7_3190 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1243_c7_3190_cond,
n16_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue,
n16_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse,
n16_MUX_uxn_opcodes_h_l1243_c7_3190_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190
result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_cond,
result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1
BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_left,
BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_right,
BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1245_c30_3760
sp_relative_shift_uxn_opcodes_h_l1245_c30_3760 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_ins,
sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_x,
sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_y,
sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a
BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_left,
BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_right,
BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_return_output);

-- MUX_uxn_opcodes_h_l1248_c21_961d
MUX_uxn_opcodes_h_l1248_c21_961d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1248_c21_961d_cond,
MUX_uxn_opcodes_h_l1248_c21_961d_iftrue,
MUX_uxn_opcodes_h_l1248_c21_961d_iffalse,
MUX_uxn_opcodes_h_l1248_c21_961d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee
CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output,
 n16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 t16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output,
 n16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output,
 t16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output,
 n16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output,
 t16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output,
 n16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output,
 t16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output,
 n16_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output,
 n16_MUX_uxn_opcodes_h_l1243_c7_3190_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_return_output,
 sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_return_output,
 MUX_uxn_opcodes_h_l1248_c21_961d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1219_c3_20b1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_3711 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1228_c3_8d59 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_7058 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1237_c3_7d13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_0349 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1248_c21_961d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1248_c21_961d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1248_c21_961d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1248_c21_961d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1230_l1227_l1214_l1243_l1239_l1235_DUPLICATE_477e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_cbd5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_f422_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_0d00_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1231_l1236_l1244_l1240_DUPLICATE_14f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1239_l1243_DUPLICATE_1f8f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1252_l1210_DUPLICATE_03e9_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_3711 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_3711;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1237_c3_7d13 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1237_c3_7d13;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1248_c21_961d_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1228_c3_8d59 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1228_c3_8d59;
     VAR_MUX_uxn_opcodes_h_l1248_c21_961d_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1219_c3_20b1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1219_c3_20b1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_0349 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_0349;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_7058 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_7058;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse := t16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1245_c30_3760] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_ins;
     sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_x;
     sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_return_output := sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c6_3569] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1239_l1243_DUPLICATE_1f8f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1239_l1243_DUPLICATE_1f8f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1230_c11_8ec4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1230_l1227_l1214_l1243_l1239_l1235_DUPLICATE_477e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1230_l1227_l1214_l1243_l1239_l1235_DUPLICATE_477e_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_f422 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_f422_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_73c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_cbd5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_cbd5_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_0d00 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_0d00_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1239_c11_aab8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1231_l1236_l1244_l1240_DUPLICATE_14f4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1231_l1236_l1244_l1240_DUPLICATE_14f4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1235_c11_f741] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_left;
     BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output := BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1243_c11_77a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_3569_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_73c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_8ec4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_f741_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_aab8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_77a1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1231_l1236_l1244_l1240_DUPLICATE_14f4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1231_l1236_l1244_l1240_DUPLICATE_14f4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1231_l1236_l1244_l1240_DUPLICATE_14f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_f422_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_f422_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_f422_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_f422_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_f422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_cbd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_cbd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_cbd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_cbd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_cbd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_0d00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_0d00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_0d00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_0d00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1230_l1227_l1243_l1239_l1235_DUPLICATE_0d00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1239_l1243_DUPLICATE_1f8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1239_l1243_DUPLICATE_1f8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1230_l1227_l1214_l1243_l1239_l1235_DUPLICATE_477e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1230_l1227_l1214_l1243_l1239_l1235_DUPLICATE_477e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1230_l1227_l1214_l1243_l1239_l1235_DUPLICATE_477e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1230_l1227_l1214_l1243_l1239_l1235_DUPLICATE_477e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1230_l1227_l1214_l1243_l1239_l1235_DUPLICATE_477e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1230_l1227_l1214_l1243_l1239_l1235_DUPLICATE_477e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1214_c2_cc76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_3760_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1244_c3_f8c1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_left;
     BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_return_output := BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1243_c7_3190] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1243_c7_3190] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1236_c3_b8f2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_left;
     BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_return_output := BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1243_c7_3190] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1243_c7_3190] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_b8f2_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f8c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_5cee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1239_c7_ad48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;

     -- t16_MUX[uxn_opcodes_h_l1235_c7_e26d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond;
     t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue;
     t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output := t16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1239_c7_ad48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1248_c21_b75a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1239_c7_ad48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;

     -- n16_MUX[uxn_opcodes_h_l1243_c7_3190] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1243_c7_3190_cond <= VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_cond;
     n16_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue;
     n16_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_return_output := n16_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1239_c7_ad48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1248_c21_961d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_b75a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;
     -- MUX[uxn_opcodes_h_l1248_c21_961d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1248_c21_961d_cond <= VAR_MUX_uxn_opcodes_h_l1248_c21_961d_cond;
     MUX_uxn_opcodes_h_l1248_c21_961d_iftrue <= VAR_MUX_uxn_opcodes_h_l1248_c21_961d_iftrue;
     MUX_uxn_opcodes_h_l1248_c21_961d_iffalse <= VAR_MUX_uxn_opcodes_h_l1248_c21_961d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1248_c21_961d_return_output := MUX_uxn_opcodes_h_l1248_c21_961d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1235_c7_e26d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1235_c7_e26d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1239_c7_ad48] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1239_c7_ad48_cond <= VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_cond;
     n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue;
     n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output := n16_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1235_c7_e26d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1235_c7_e26d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1230_c7_41fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond;
     t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue;
     t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output := t16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue := VAR_MUX_uxn_opcodes_h_l1248_c21_961d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1230_c7_41fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1230_c7_41fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1230_c7_41fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1235_c7_e26d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_cond;
     n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue;
     n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output := n16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1243_c7_3190] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_return_output := result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1230_c7_41fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;

     -- t16_MUX[uxn_opcodes_h_l1227_c7_17fe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond <= VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond;
     t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue;
     t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output := t16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_3190_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;
     -- n16_MUX[uxn_opcodes_h_l1230_c7_41fa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_cond;
     n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue;
     n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output := n16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1239_c7_ad48] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output := result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_17fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_17fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_17fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_17fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;

     -- t16_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := t16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_ad48_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1235_c7_e26d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- n16_MUX[uxn_opcodes_h_l1227_c7_17fe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_cond;
     n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue;
     n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output := n16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_e26d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1230_c7_41fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := n16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_41fa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_17fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_17fe_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1214_c2_cc76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output := result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1252_l1210_DUPLICATE_03e9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1252_l1210_DUPLICATE_03e9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_cc76_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1252_l1210_DUPLICATE_03e9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1252_l1210_DUPLICATE_03e9_return_output;
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
