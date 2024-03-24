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
-- BIN_OP_EQ[uxn_opcodes_h_l1198_c6_0cc7]
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1198_c2_a832]
signal t16_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1198_c2_a832]
signal n16_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c2_a832]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1198_c2_a832]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c2_a832]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c2_a832]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1198_c2_a832]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c2_a832]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1198_c2_a832]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1198_c2_a832]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1198_c2_a832]
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1211_c11_774c]
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1211_c7_7d66]
signal t16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1211_c7_7d66]
signal n16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1211_c7_7d66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1211_c7_7d66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1211_c7_7d66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1211_c7_7d66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1211_c7_7d66]
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_e607]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1214_c7_de4b]
signal t16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1214_c7_de4b]
signal n16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_de4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_de4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_de4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_de4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1214_c7_de4b]
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1219_c11_2da8]
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1219_c7_b1a3]
signal t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1219_c7_b1a3]
signal n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1219_c7_b1a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1219_c7_b1a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1219_c7_b1a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1219_c7_b1a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1219_c7_b1a3]
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1220_c3_1771]
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1223_c11_1efe]
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1223_c7_a869]
signal n16_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1223_c7_a869]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1223_c7_a869]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1223_c7_a869]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1223_c7_a869]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1223_c7_a869]
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_cd6b]
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1227_c7_4411]
signal n16_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_4411]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_4411]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_4411]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_4411]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_4411]
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1228_c3_5362]
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1229_c30_ce98]
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1232_c21_49bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1232_c21_40bc]
signal MUX_uxn_opcodes_h_l1232_c21_40bc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_40bc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_40bc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1232_c21_40bc_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_left,
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_right,
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output);

-- t16_MUX_uxn_opcodes_h_l1198_c2_a832
t16_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
t16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
t16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
t16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- n16_MUX_uxn_opcodes_h_l1198_c2_a832
n16_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
n16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
n16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
n16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_cond,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_left,
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_right,
BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output);

-- t16_MUX_uxn_opcodes_h_l1211_c7_7d66
t16_MUX_uxn_opcodes_h_l1211_c7_7d66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond,
t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue,
t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse,
t16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output);

-- n16_MUX_uxn_opcodes_h_l1211_c7_7d66
n16_MUX_uxn_opcodes_h_l1211_c7_7d66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond,
n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue,
n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse,
n16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_cond,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output);

-- t16_MUX_uxn_opcodes_h_l1214_c7_de4b
t16_MUX_uxn_opcodes_h_l1214_c7_de4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond,
t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue,
t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse,
t16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output);

-- n16_MUX_uxn_opcodes_h_l1214_c7_de4b
n16_MUX_uxn_opcodes_h_l1214_c7_de4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond,
n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue,
n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse,
n16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_left,
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_right,
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output);

-- t16_MUX_uxn_opcodes_h_l1219_c7_b1a3
t16_MUX_uxn_opcodes_h_l1219_c7_b1a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond,
t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue,
t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse,
t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output);

-- n16_MUX_uxn_opcodes_h_l1219_c7_b1a3
n16_MUX_uxn_opcodes_h_l1219_c7_b1a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond,
n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue,
n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse,
n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771
BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_left,
BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_right,
BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_left,
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_right,
BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output);

-- n16_MUX_uxn_opcodes_h_l1223_c7_a869
n16_MUX_uxn_opcodes_h_l1223_c7_a869 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1223_c7_a869_cond,
n16_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue,
n16_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse,
n16_MUX_uxn_opcodes_h_l1223_c7_a869_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_cond,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_left,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_right,
BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output);

-- n16_MUX_uxn_opcodes_h_l1227_c7_4411
n16_MUX_uxn_opcodes_h_l1227_c7_4411 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1227_c7_4411_cond,
n16_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue,
n16_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse,
n16_MUX_uxn_opcodes_h_l1227_c7_4411_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_cond,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362
BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_left,
BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_right,
BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98
sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_ins,
sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_x,
sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_y,
sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_return_output);

-- MUX_uxn_opcodes_h_l1232_c21_40bc
MUX_uxn_opcodes_h_l1232_c21_40bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1232_c21_40bc_cond,
MUX_uxn_opcodes_h_l1232_c21_40bc_iftrue,
MUX_uxn_opcodes_h_l1232_c21_40bc_iffalse,
MUX_uxn_opcodes_h_l1232_c21_40bc_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output,
 t16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 n16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output,
 t16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output,
 n16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output,
 t16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output,
 n16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output,
 t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output,
 n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output,
 n16_MUX_uxn_opcodes_h_l1223_c7_a869_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output,
 n16_MUX_uxn_opcodes_h_l1227_c7_4411_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_return_output,
 sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_return_output,
 MUX_uxn_opcodes_h_l1232_c21_40bc_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_15fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_5fb2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_f8a7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_1245 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_3cf3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_97b6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1227_l1223_l1219_l1214_l1211_DUPLICATE_b4d2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_51aa_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_45e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_621b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1220_l1215_l1224_l1228_DUPLICATE_bb05_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1227_l1223_DUPLICATE_7749_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1236_l1194_DUPLICATE_416b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_3cf3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1221_c3_3cf3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_f8a7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1212_c3_f8a7;
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_5fb2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1203_c3_5fb2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_1245 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1217_c3_1245;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_15fe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_15fe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_97b6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_97b6;
     VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse := t16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_a832_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1227_l1223_DUPLICATE_7749 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1227_l1223_DUPLICATE_7749_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_a832_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1220_l1215_l1224_l1228_DUPLICATE_bb05 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1220_l1215_l1224_l1228_DUPLICATE_bb05_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_51aa LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_51aa_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1227_c11_cd6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_a832_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_621b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_621b_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1227_l1223_l1219_l1214_l1211_DUPLICATE_b4d2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1227_l1223_l1219_l1214_l1211_DUPLICATE_b4d2_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1198_c6_0cc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_45e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_45e6_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_a832_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1229_c30_ce98] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_ins;
     sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_x;
     sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_return_output := sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1219_c11_2da8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1223_c11_1efe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1211_c11_774c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_e607] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_0cc7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1211_c11_774c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_e607_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_2da8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1223_c11_1efe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c11_cd6b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1220_l1215_l1224_l1228_DUPLICATE_bb05_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1220_l1215_l1224_l1228_DUPLICATE_bb05_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1220_l1215_l1224_l1228_DUPLICATE_bb05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_51aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_51aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_51aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_51aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_51aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_45e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_45e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_45e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_45e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_45e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_621b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_621b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_621b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_621b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1227_l1223_l1219_l1214_l1211_DUPLICATE_621b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1227_l1223_DUPLICATE_7749_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1227_l1223_DUPLICATE_7749_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1227_l1223_l1219_l1214_l1211_DUPLICATE_b4d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1227_l1223_l1219_l1214_l1211_DUPLICATE_b4d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1227_l1223_l1219_l1214_l1211_DUPLICATE_b4d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1227_l1223_l1219_l1214_l1211_DUPLICATE_b4d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1227_l1223_l1219_l1214_l1211_DUPLICATE_b4d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1227_l1223_l1219_l1214_l1211_DUPLICATE_b4d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1198_c2_a832_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1198_c2_a832_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1198_c2_a832_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1198_c2_a832_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1229_c30_ce98_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c7_4411] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1220_c3_1771] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_left;
     BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_return_output := BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c7_4411] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c7_4411] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c7_4411] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1228_c3_5362] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_left;
     BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_return_output := BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1220_c3_1771_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1228_c3_5362_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1216_l1225_DUPLICATE_c19d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1223_c7_a869] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1232_c21_49bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1219_c7_b1a3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond;
     t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue;
     t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output := t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1227_c7_4411] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1227_c7_4411_cond <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_cond;
     n16_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue;
     n16_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_return_output := n16_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1223_c7_a869] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1223_c7_a869] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1223_c7_a869] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1232_c21_49bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1219_c7_b1a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1219_c7_b1a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;

     -- MUX[uxn_opcodes_h_l1232_c21_40bc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1232_c21_40bc_cond <= VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_cond;
     MUX_uxn_opcodes_h_l1232_c21_40bc_iftrue <= VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_iftrue;
     MUX_uxn_opcodes_h_l1232_c21_40bc_iffalse <= VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_return_output := MUX_uxn_opcodes_h_l1232_c21_40bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1219_c7_b1a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1219_c7_b1a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1214_c7_de4b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond;
     t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue;
     t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output := t16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1223_c7_a869] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1223_c7_a869_cond <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_cond;
     n16_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue;
     n16_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_return_output := n16_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue := VAR_MUX_uxn_opcodes_h_l1232_c21_40bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_de4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1227_c7_4411] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_return_output := result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;

     -- n16_MUX[uxn_opcodes_h_l1219_c7_b1a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond;
     n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue;
     n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output := n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1214_c7_de4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_de4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_de4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1211_c7_7d66] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond;
     t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue;
     t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output := t16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1227_c7_4411_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;
     -- t16_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     t16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     t16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := t16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1211_c7_7d66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;

     -- n16_MUX[uxn_opcodes_h_l1214_c7_de4b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_cond;
     n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue;
     n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output := n16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1211_c7_7d66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1223_c7_a869] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_return_output := result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1211_c7_7d66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1211_c7_7d66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1223_c7_a869_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;
     -- n16_MUX[uxn_opcodes_h_l1211_c7_7d66] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_cond;
     n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue;
     n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output := n16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1219_c7_b1a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1219_c7_b1a3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1214_c7_de4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     n16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     n16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := n16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_de4b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1211_c7_7d66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output := result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1211_c7_7d66_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1198_c2_a832] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_return_output := result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1236_l1194_DUPLICATE_416b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1236_l1194_DUPLICATE_416b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1198_c2_a832_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_a832_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1236_l1194_DUPLICATE_416b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1236_l1194_DUPLICATE_416b_return_output;
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
