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
-- BIN_OP_EQ[uxn_opcodes_h_l1214_c6_7673]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal n16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1214_c2_1b60]
signal t16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_11f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1227_c7_4604]
signal n16_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_4604]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_4604]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_4604]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_4604]
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_4604]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1227_c7_4604]
signal t16_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1230_c11_a52b]
signal BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1230_c7_9f11]
signal n16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1230_c7_9f11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1230_c7_9f11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1230_c7_9f11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1230_c7_9f11]
signal result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1230_c7_9f11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1230_c7_9f11]
signal t16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1235_c11_ff86]
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1235_c7_b8a0]
signal n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1235_c7_b8a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1235_c7_b8a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1235_c7_b8a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1235_c7_b8a0]
signal result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1235_c7_b8a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1235_c7_b8a0]
signal t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1236_c3_d732]
signal BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1239_c11_3d05]
signal BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1239_c7_edd3]
signal n16_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1239_c7_edd3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1239_c7_edd3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1239_c7_edd3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1239_c7_edd3]
signal result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1239_c7_edd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1243_c11_f74e]
signal BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1243_c7_a6c4]
signal n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1243_c7_a6c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1243_c7_a6c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1243_c7_a6c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1243_c7_a6c4]
signal result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1243_c7_a6c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1244_c3_f72d]
signal BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1245_c30_0763]
signal sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1248_c21_a601]
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1248_c21_87d4]
signal MUX_uxn_opcodes_h_l1248_c21_87d4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1248_c21_87d4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1248_c21_87d4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1248_c21_87d4_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673
BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output);

-- n16_MUX_uxn_opcodes_h_l1214_c2_1b60
n16_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
n16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60
result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60
result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60
result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60
result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- t16_MUX_uxn_opcodes_h_l1214_c2_1b60
t16_MUX_uxn_opcodes_h_l1214_c2_1b60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond,
t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue,
t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse,
t16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output);

-- n16_MUX_uxn_opcodes_h_l1227_c7_4604
n16_MUX_uxn_opcodes_h_l1227_c7_4604 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1227_c7_4604_cond,
n16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue,
n16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse,
n16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_cond,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_return_output);

-- t16_MUX_uxn_opcodes_h_l1227_c7_4604
t16_MUX_uxn_opcodes_h_l1227_c7_4604 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1227_c7_4604_cond,
t16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue,
t16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse,
t16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_left,
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_right,
BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output);

-- n16_MUX_uxn_opcodes_h_l1230_c7_9f11
n16_MUX_uxn_opcodes_h_l1230_c7_9f11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond,
n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue,
n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse,
n16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11
result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11
result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_cond,
result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output);

-- t16_MUX_uxn_opcodes_h_l1230_c7_9f11
t16_MUX_uxn_opcodes_h_l1230_c7_9f11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond,
t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue,
t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse,
t16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_left,
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_right,
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output);

-- n16_MUX_uxn_opcodes_h_l1235_c7_b8a0
n16_MUX_uxn_opcodes_h_l1235_c7_b8a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond,
n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue,
n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse,
n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0
result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output);

-- t16_MUX_uxn_opcodes_h_l1235_c7_b8a0
t16_MUX_uxn_opcodes_h_l1235_c7_b8a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond,
t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue,
t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse,
t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732
BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_left,
BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_right,
BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05
BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_left,
BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_right,
BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output);

-- n16_MUX_uxn_opcodes_h_l1239_c7_edd3
n16_MUX_uxn_opcodes_h_l1239_c7_edd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1239_c7_edd3_cond,
n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue,
n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse,
n16_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3
result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3
result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3
result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_left,
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_right,
BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output);

-- n16_MUX_uxn_opcodes_h_l1243_c7_a6c4
n16_MUX_uxn_opcodes_h_l1243_c7_a6c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond,
n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue,
n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse,
n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4
result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d
BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_left,
BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_right,
BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1245_c30_0763
sp_relative_shift_uxn_opcodes_h_l1245_c30_0763 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_ins,
sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_x,
sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_y,
sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601
BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_left,
BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_right,
BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_return_output);

-- MUX_uxn_opcodes_h_l1248_c21_87d4
MUX_uxn_opcodes_h_l1248_c21_87d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1248_c21_87d4_cond,
MUX_uxn_opcodes_h_l1248_c21_87d4_iftrue,
MUX_uxn_opcodes_h_l1248_c21_87d4_iffalse,
MUX_uxn_opcodes_h_l1248_c21_87d4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55
CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output,
 n16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 t16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output,
 n16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_return_output,
 t16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output,
 n16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output,
 t16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output,
 n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output,
 t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output,
 n16_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output,
 n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_return_output,
 MUX_uxn_opcodes_h_l1248_c21_87d4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1219_c3_df29 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_877a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1228_c3_94c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_17f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1237_c3_56df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_b7c2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1214_l1243_DUPLICATE_6c37_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_548d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_5963_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_617d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1236_l1244_l1231_l1240_DUPLICATE_b77f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1243_l1239_DUPLICATE_a633_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1252_l1210_DUPLICATE_c0ec_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1219_c3_df29 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1219_c3_df29;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1228_c3_94c7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1228_c3_94c7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_b7c2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_b7c2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_877a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_877a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1237_c3_56df := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1237_c3_56df;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_17f4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_17f4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1236_l1244_l1231_l1240_DUPLICATE_b77f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1236_l1244_l1231_l1240_DUPLICATE_b77f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_5963 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_5963_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1235_c11_ff86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_left;
     BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output := BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1214_l1243_DUPLICATE_6c37 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1214_l1243_DUPLICATE_6c37_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1243_l1239_DUPLICATE_a633 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1243_l1239_DUPLICATE_a633_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_548d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_548d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_617d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_617d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1230_c11_a52b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1245_c30_0763] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_ins;
     sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_x;
     sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_return_output := sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c6_7673] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1243_c11_f74e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_11f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1239_c11_3d05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c6_7673_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_11f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1230_c11_a52b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_ff86_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1239_c11_3d05_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1243_c11_f74e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1236_l1244_l1231_l1240_DUPLICATE_b77f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1236_l1244_l1231_l1240_DUPLICATE_b77f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1236_l1244_l1231_l1240_DUPLICATE_b77f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_548d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_548d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_548d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_548d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_548d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_617d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_617d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_617d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_617d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_617d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_5963_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_5963_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_5963_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_5963_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1243_DUPLICATE_5963_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1243_l1239_DUPLICATE_a633_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1243_l1239_DUPLICATE_a633_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1214_l1243_DUPLICATE_6c37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1214_l1243_DUPLICATE_6c37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1214_l1243_DUPLICATE_6c37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1214_l1243_DUPLICATE_6c37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1214_l1243_DUPLICATE_6c37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1239_l1235_l1230_l1227_l1214_l1243_DUPLICATE_6c37_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1214_c2_1b60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1245_c30_0763_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1243_c7_a6c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1236_c3_d732] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_left;
     BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_return_output := BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1243_c7_a6c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1243_c7_a6c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1243_c7_a6c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1244_c3_f72d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_left;
     BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_return_output := BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1236_c3_d732_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1244_c3_f72d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1232_l1241_DUPLICATE_fb55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1239_c7_edd3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1239_c7_edd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1243_c7_a6c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond;
     n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue;
     n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output := n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1248_c21_a601] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_left;
     BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_return_output := BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1239_c7_edd3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1235_c7_b8a0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond;
     t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue;
     t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output := t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1239_c7_edd3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c21_a601_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1235_c7_b8a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1239_c7_edd3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1239_c7_edd3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_cond;
     n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue;
     n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output := n16_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1235_c7_b8a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1235_c7_b8a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;

     -- MUX[uxn_opcodes_h_l1248_c21_87d4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1248_c21_87d4_cond <= VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_cond;
     MUX_uxn_opcodes_h_l1248_c21_87d4_iftrue <= VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_iftrue;
     MUX_uxn_opcodes_h_l1248_c21_87d4_iffalse <= VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_return_output := MUX_uxn_opcodes_h_l1248_c21_87d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1235_c7_b8a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1230_c7_9f11] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond <= VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond;
     t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue;
     t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output := t16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue := VAR_MUX_uxn_opcodes_h_l1248_c21_87d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1230_c7_9f11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1230_c7_9f11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1230_c7_9f11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1230_c7_9f11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1243_c7_a6c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1235_c7_b8a0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond;
     n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue;
     n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output := n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1227_c7_4604] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1227_c7_4604_cond <= VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_cond;
     t16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue;
     t16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output := t16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1243_c7_a6c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_4604] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;

     -- t16_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := t16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_4604] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;

     -- n16_MUX[uxn_opcodes_h_l1230_c7_9f11] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond <= VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_cond;
     n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue;
     n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output := n16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1239_c7_edd3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_4604] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_4604] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1239_c7_edd3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- n16_MUX[uxn_opcodes_h_l1227_c7_4604] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1227_c7_4604_cond <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_cond;
     n16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue;
     n16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output := n16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1235_c7_b8a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1235_c7_b8a0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1230_c7_9f11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output := result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;

     -- n16_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := n16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1230_c7_9f11_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_4604] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_return_output := result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4604_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1214_c2_1b60] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output := result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1252_l1210_DUPLICATE_c0ec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1252_l1210_DUPLICATE_c0ec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1214_c2_1b60_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1252_l1210_DUPLICATE_c0ec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1252_l1210_DUPLICATE_c0ec_return_output;
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
