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
-- Submodules: 73
entity div2_0CLK_7cf9dac2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_7cf9dac2;
architecture arch of div2_0CLK_7cf9dac2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2108_c6_3f36]
signal BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal n16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2108_c2_b27f]
signal t16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_2573]
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2121_c7_e1b4]
signal n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2121_c7_e1b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2121_c7_e1b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2121_c7_e1b4]
signal result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2121_c7_e1b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2121_c7_e1b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2121_c7_e1b4]
signal tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2121_c7_e1b4]
signal t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2124_c11_ef53]
signal BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2124_c7_31c5]
signal n16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2124_c7_31c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2124_c7_31c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2124_c7_31c5]
signal result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2124_c7_31c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2124_c7_31c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2124_c7_31c5]
signal tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2124_c7_31c5]
signal t16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2129_c11_45fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2129_c7_280d]
signal n16_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2129_c7_280d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2129_c7_280d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2129_c7_280d]
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2129_c7_280d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2129_c7_280d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2129_c7_280d]
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2129_c7_280d]
signal t16_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2130_c3_e454]
signal BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_7004]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2133_c7_3229]
signal n16_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_3229]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_3229]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2133_c7_3229]
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_3229]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c7_3229]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2133_c7_3229]
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2137_c11_e8de]
signal BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2137_c7_ca52]
signal n16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2137_c7_ca52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2137_c7_ca52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2137_c7_ca52]
signal result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2137_c7_ca52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2137_c7_ca52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2137_c7_ca52]
signal tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2138_c3_4291]
signal BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2139_c11_ebb9]
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2139_c26_1e23]
signal BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2139_c11_991d]
signal MUX_uxn_opcodes_h_l2139_c11_991d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2139_c11_991d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2139_c11_991d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2139_c11_991d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2140_c30_a590]
signal sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_a863]
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_bd45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_bd45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_bd45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2145_c7_bd45]
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2148_c31_97f5]
signal CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
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
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36
BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_left,
BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_right,
BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output);

-- n16_MUX_uxn_opcodes_h_l2108_c2_b27f
n16_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
n16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f
result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f
result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f
result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f
result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f
tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- t16_MUX_uxn_opcodes_h_l2108_c2_b27f
t16_MUX_uxn_opcodes_h_l2108_c2_b27f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond,
t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue,
t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse,
t16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_left,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_right,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output);

-- n16_MUX_uxn_opcodes_h_l2121_c7_e1b4
n16_MUX_uxn_opcodes_h_l2121_c7_e1b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond,
n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue,
n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse,
n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4
result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4
tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond,
tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output);

-- t16_MUX_uxn_opcodes_h_l2121_c7_e1b4
t16_MUX_uxn_opcodes_h_l2121_c7_e1b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond,
t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue,
t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse,
t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_left,
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_right,
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output);

-- n16_MUX_uxn_opcodes_h_l2124_c7_31c5
n16_MUX_uxn_opcodes_h_l2124_c7_31c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond,
n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue,
n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse,
n16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5
result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5
tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond,
tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output);

-- t16_MUX_uxn_opcodes_h_l2124_c7_31c5
t16_MUX_uxn_opcodes_h_l2124_c7_31c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond,
t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue,
t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse,
t16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output);

-- n16_MUX_uxn_opcodes_h_l2129_c7_280d
n16_MUX_uxn_opcodes_h_l2129_c7_280d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2129_c7_280d_cond,
n16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue,
n16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse,
n16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2129_c7_280d
tmp16_MUX_uxn_opcodes_h_l2129_c7_280d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_cond,
tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output);

-- t16_MUX_uxn_opcodes_h_l2129_c7_280d
t16_MUX_uxn_opcodes_h_l2129_c7_280d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2129_c7_280d_cond,
t16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue,
t16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse,
t16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454
BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_left,
BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_right,
BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output);

-- n16_MUX_uxn_opcodes_h_l2133_c7_3229
n16_MUX_uxn_opcodes_h_l2133_c7_3229 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2133_c7_3229_cond,
n16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue,
n16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse,
n16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_cond,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2133_c7_3229
tmp16_MUX_uxn_opcodes_h_l2133_c7_3229 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_cond,
tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue,
tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse,
tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_left,
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_right,
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output);

-- n16_MUX_uxn_opcodes_h_l2137_c7_ca52
n16_MUX_uxn_opcodes_h_l2137_c7_ca52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond,
n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue,
n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse,
n16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52
result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_cond,
result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52
result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52
tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond,
tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue,
tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse,
tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291
BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_left,
BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_right,
BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_left,
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_right,
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23
BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_left,
BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_right,
BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_return_output);

-- MUX_uxn_opcodes_h_l2139_c11_991d
MUX_uxn_opcodes_h_l2139_c11_991d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2139_c11_991d_cond,
MUX_uxn_opcodes_h_l2139_c11_991d_iftrue,
MUX_uxn_opcodes_h_l2139_c11_991d_iffalse,
MUX_uxn_opcodes_h_l2139_c11_991d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2140_c30_a590
sp_relative_shift_uxn_opcodes_h_l2140_c30_a590 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_ins,
sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_x,
sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_y,
sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_left,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_right,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_cond,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5
CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_x,
CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1
CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output,
 n16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 t16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output,
 n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output,
 t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output,
 n16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output,
 t16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output,
 n16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output,
 t16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output,
 n16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_return_output,
 tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output,
 n16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output,
 tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_return_output,
 MUX_uxn_opcodes_h_l2139_c11_991d_return_output,
 sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output,
 CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2118_c3_1639 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2113_c3_59f8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2122_c3_1c45 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_7349 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2131_c3_a425 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_2574 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2139_c11_991d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2139_c11_991d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2139_c11_991d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2139_c11_991d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2143_c21_d5e7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_6995 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2146_c3_b587 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_fad5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_l2108_DUPLICATE_cd8a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2137_l2133_l2129_l2124_l2121_DUPLICATE_adbb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2137_l2133_l2129_l2124_l2121_DUPLICATE_c73c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_DUPLICATE_33d9_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2125_l2138_l2130_l2134_DUPLICATE_9f4d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2133_DUPLICATE_7c3b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2104_l2152_DUPLICATE_dd6a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2131_c3_a425 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2131_c3_a425;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_6995 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_6995;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2113_c3_59f8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2113_c3_59f8;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2146_c3_b587 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2146_c3_b587;
     VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2118_c3_1639 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2118_c3_1639;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_7349 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_7349;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2139_c11_991d_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2122_c3_1c45 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2122_c3_1c45;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_2574 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_2574;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse := tmp16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2125_l2138_l2130_l2134_DUPLICATE_9f4d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2125_l2138_l2130_l2134_DUPLICATE_9f4d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_2573] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_left;
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output := BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_l2108_DUPLICATE_cd8a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_l2108_DUPLICATE_cd8a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_a863] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_left;
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_return_output := BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2139_c11_ebb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2137_l2133_l2129_l2124_l2121_DUPLICATE_adbb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2137_l2133_l2129_l2124_l2121_DUPLICATE_adbb_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2140_c30_a590] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_ins;
     sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_x;
     sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_return_output := sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2137_l2133_l2129_l2124_l2121_DUPLICATE_c73c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2137_l2133_l2129_l2124_l2121_DUPLICATE_c73c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2124_c11_ef53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2129_c11_45fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2137_c11_e8de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_DUPLICATE_33d9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_DUPLICATE_33d9_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2133_DUPLICATE_7c3b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2133_DUPLICATE_7c3b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_7004] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2148_c31_97f5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_return_output := CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2108_c6_3f36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_left;
     BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output := BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c6_3f36_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2573_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_ef53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_45fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_7004_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_e8de_return_output;
     VAR_MUX_uxn_opcodes_h_l2139_c11_991d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_ebb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_a863_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2125_l2138_l2130_l2134_DUPLICATE_9f4d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2125_l2138_l2130_l2134_DUPLICATE_9f4d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2125_l2138_l2130_l2134_DUPLICATE_9f4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_DUPLICATE_33d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_DUPLICATE_33d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_DUPLICATE_33d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_DUPLICATE_33d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_DUPLICATE_33d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2137_l2133_l2129_l2124_l2121_DUPLICATE_adbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2137_l2133_l2129_l2124_l2121_DUPLICATE_adbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2137_l2133_l2129_l2124_l2121_DUPLICATE_adbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2137_l2133_l2129_l2124_l2121_DUPLICATE_adbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2137_l2133_l2129_l2124_l2121_DUPLICATE_adbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2137_l2133_l2129_l2124_l2121_DUPLICATE_adbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2137_l2133_l2129_l2124_l2121_DUPLICATE_c73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2137_l2133_l2129_l2124_l2121_DUPLICATE_c73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2137_l2133_l2129_l2124_l2121_DUPLICATE_c73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2137_l2133_l2129_l2124_l2121_DUPLICATE_c73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2137_l2133_l2129_l2124_l2121_DUPLICATE_c73c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2133_DUPLICATE_7c3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2133_DUPLICATE_7c3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_l2108_DUPLICATE_cd8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_l2108_DUPLICATE_cd8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_l2108_DUPLICATE_cd8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_l2108_DUPLICATE_cd8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_l2108_DUPLICATE_cd8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2133_l2129_l2124_l2121_l2108_DUPLICATE_cd8a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2108_c2_b27f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2140_c30_a590_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2138_c3_4291] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_left;
     BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_return_output := BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2130_c3_e454] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_left;
     BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_return_output := BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_bd45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2148_c21_fad5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_fad5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2148_c31_97f5_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2137_c7_ca52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_bd45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_bd45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2130_c3_e454_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2138_c3_4291_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_fad5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2135_l2126_DUPLICATE_7fc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output;
     -- n16_MUX[uxn_opcodes_h_l2137_c7_ca52] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond <= VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond;
     n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue;
     n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output := n16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2137_c7_ca52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2145_c7_bd45] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output := result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_3229] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2137_c7_ca52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2137_c7_ca52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2139_c26_1e23] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_left;
     BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_return_output := BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_return_output;

     -- t16_MUX[uxn_opcodes_h_l2129_c7_280d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2129_c7_280d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_cond;
     t16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue;
     t16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output := t16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2139_c11_991d_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2139_c26_1e23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_bd45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2129_c7_280d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_3229] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_3229] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;

     -- MUX[uxn_opcodes_h_l2139_c11_991d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2139_c11_991d_cond <= VAR_MUX_uxn_opcodes_h_l2139_c11_991d_cond;
     MUX_uxn_opcodes_h_l2139_c11_991d_iftrue <= VAR_MUX_uxn_opcodes_h_l2139_c11_991d_iftrue;
     MUX_uxn_opcodes_h_l2139_c11_991d_iffalse <= VAR_MUX_uxn_opcodes_h_l2139_c11_991d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2139_c11_991d_return_output := MUX_uxn_opcodes_h_l2139_c11_991d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2133_c7_3229] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2133_c7_3229_cond <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_cond;
     n16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue;
     n16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output := n16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;

     -- t16_MUX[uxn_opcodes_h_l2124_c7_31c5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond;
     t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue;
     t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output := t16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c7_3229] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue := VAR_MUX_uxn_opcodes_h_l2139_c11_991d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2129_c7_280d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2137_c7_ca52] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_cond;
     tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output := tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2143_c21_d5e7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2143_c21_d5e7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2139_c11_991d_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2129_c7_280d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2121_c7_e1b4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond;
     t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue;
     t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output := t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2129_c7_280d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2129_c7_280d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_cond;
     n16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue;
     n16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output := n16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2129_c7_280d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2124_c7_31c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2143_c21_d5e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;
     -- t16_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := t16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2121_c7_e1b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2133_c7_3229] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_cond;
     tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output := tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2137_c7_ca52] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output := result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2124_c7_31c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2124_c7_31c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2124_c7_31c5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond;
     n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue;
     n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output := n16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2124_c7_31c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_ca52_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2121_c7_e1b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2121_c7_e1b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2121_c7_e1b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2133_c7_3229] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_return_output := result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2129_c7_280d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_cond;
     tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output := tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2121_c7_e1b4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond;
     n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue;
     n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output := n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_3229_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2129_c7_280d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2124_c7_31c5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_cond;
     tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output := tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := n16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_280d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2121_c7_e1b4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond;
     tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output := tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2124_c7_31c5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2124_c7_31c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2121_c7_e1b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2121_c7_e1b4_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2108_c2_b27f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2104_l2152_DUPLICATE_dd6a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2104_l2152_DUPLICATE_dd6a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2108_c2_b27f_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2104_l2152_DUPLICATE_dd6a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2104_l2152_DUPLICATE_dd6a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
