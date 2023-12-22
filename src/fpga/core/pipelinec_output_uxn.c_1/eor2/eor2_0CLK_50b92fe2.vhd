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
-- Submodules: 71
entity eor2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_50b92fe2;
architecture arch of eor2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1129_c6_1da7]
signal BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1129_c2_b857]
signal n16_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1129_c2_b857]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1129_c2_b857]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1129_c2_b857]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1129_c2_b857]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1129_c2_b857]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1129_c2_b857]
signal result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1129_c2_b857]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1129_c2_b857]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1129_c2_b857]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1129_c2_b857]
signal tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1129_c2_b857]
signal t16_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1142_c11_11bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1142_c7_cf6f]
signal n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1142_c7_cf6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1142_c7_cf6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1142_c7_cf6f]
signal result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1142_c7_cf6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1142_c7_cf6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1142_c7_cf6f]
signal tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1142_c7_cf6f]
signal t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1145_c11_6f57]
signal BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1145_c7_11b3]
signal n16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1145_c7_11b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1145_c7_11b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1145_c7_11b3]
signal result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1145_c7_11b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1145_c7_11b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1145_c7_11b3]
signal tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1145_c7_11b3]
signal t16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1150_c11_7a39]
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1150_c7_1605]
signal n16_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1150_c7_1605]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1150_c7_1605]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1150_c7_1605]
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1150_c7_1605]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1150_c7_1605]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1150_c7_1605]
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1150_c7_1605]
signal t16_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1151_c3_c524]
signal BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1154_c11_c948]
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1154_c7_3bff]
signal n16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1154_c7_3bff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1154_c7_3bff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1154_c7_3bff]
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1154_c7_3bff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1154_c7_3bff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1154_c7_3bff]
signal tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1158_c11_6a5a]
signal BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1158_c7_2a07]
signal n16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1158_c7_2a07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1158_c7_2a07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1158_c7_2a07]
signal result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1158_c7_2a07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1158_c7_2a07]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1158_c7_2a07]
signal tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1159_c3_db9c]
signal BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1160_c11_f6ca]
signal BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1161_c30_75c8]
signal sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1166_c11_1c45]
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1166_c7_e01b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1166_c7_e01b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1166_c7_e01b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1166_c7_e01b]
signal result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1169_c31_f589]
signal CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7
BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_left,
BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_right,
BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output);

-- n16_MUX_uxn_opcodes_h_l1129_c2_b857
n16_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
n16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
n16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
n16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857
result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857
result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857
result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857
result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857
result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1129_c2_b857
tmp16_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- t16_MUX_uxn_opcodes_h_l1129_c2_b857
t16_MUX_uxn_opcodes_h_l1129_c2_b857 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1129_c2_b857_cond,
t16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue,
t16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse,
t16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output);

-- n16_MUX_uxn_opcodes_h_l1142_c7_cf6f
n16_MUX_uxn_opcodes_h_l1142_c7_cf6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond,
n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue,
n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse,
n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f
result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f
tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond,
tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output);

-- t16_MUX_uxn_opcodes_h_l1142_c7_cf6f
t16_MUX_uxn_opcodes_h_l1142_c7_cf6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond,
t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue,
t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse,
t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57
BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_left,
BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_right,
BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output);

-- n16_MUX_uxn_opcodes_h_l1145_c7_11b3
n16_MUX_uxn_opcodes_h_l1145_c7_11b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond,
n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue,
n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse,
n16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3
result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3
result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3
result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3
tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond,
tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output);

-- t16_MUX_uxn_opcodes_h_l1145_c7_11b3
t16_MUX_uxn_opcodes_h_l1145_c7_11b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond,
t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue,
t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse,
t16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_left,
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_right,
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output);

-- n16_MUX_uxn_opcodes_h_l1150_c7_1605
n16_MUX_uxn_opcodes_h_l1150_c7_1605 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1150_c7_1605_cond,
n16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue,
n16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse,
n16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_cond,
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1150_c7_1605
tmp16_MUX_uxn_opcodes_h_l1150_c7_1605 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_cond,
tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue,
tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse,
tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output);

-- t16_MUX_uxn_opcodes_h_l1150_c7_1605
t16_MUX_uxn_opcodes_h_l1150_c7_1605 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1150_c7_1605_cond,
t16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue,
t16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse,
t16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524
BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_left,
BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_right,
BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_left,
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_right,
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output);

-- n16_MUX_uxn_opcodes_h_l1154_c7_3bff
n16_MUX_uxn_opcodes_h_l1154_c7_3bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond,
n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue,
n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse,
n16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff
tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond,
tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue,
tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse,
tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a
BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_left,
BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_right,
BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output);

-- n16_MUX_uxn_opcodes_h_l1158_c7_2a07
n16_MUX_uxn_opcodes_h_l1158_c7_2a07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond,
n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue,
n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse,
n16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07
result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07
result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_cond,
result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07
result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07
result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07
tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond,
tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue,
tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse,
tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c
BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_left,
BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_right,
BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca
BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_left,
BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_right,
BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8
sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_ins,
sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_x,
sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_y,
sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_left,
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_right,
BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b
result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1169_c31_f589
CONST_SR_8_uxn_opcodes_h_l1169_c31_f589 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_x,
CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf
CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output,
 n16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 t16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output,
 n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output,
 t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output,
 n16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output,
 t16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output,
 n16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_return_output,
 tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output,
 t16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output,
 n16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output,
 tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output,
 n16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output,
 tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_return_output,
 sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1139_c3_ce7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1134_c3_e88c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_729c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_48d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_718c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1163_c3_f167 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1164_c21_8c96_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_6b86 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1167_c3_c3e9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1169_c21_d6b1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1129_l1166_l1154_l1150_l1145_l1142_DUPLICATE_2712_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1166_l1158_l1154_l1150_l1145_l1142_DUPLICATE_adc9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1158_l1154_l1150_l1145_l1142_DUPLICATE_8d43_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1166_l1154_l1150_l1145_l1142_DUPLICATE_5ff1_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1146_l1151_l1155_l1159_DUPLICATE_6eed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1166_l1154_DUPLICATE_7817_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1173_l1125_DUPLICATE_5f5e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1163_c3_f167 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1163_c3_f167;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_6b86 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_6b86;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1139_c3_ce7f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1139_c3_ce7f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_729c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_729c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_48d8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_48d8;
     VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1134_c3_e88c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1134_c3_e88c;
     VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_718c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_718c;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1167_c3_c3e9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1167_c3_c3e9;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse := tmp16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1129_c2_b857_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1129_c2_b857_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1150_c11_7a39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_left;
     BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output := BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1158_l1154_l1150_l1145_l1142_DUPLICATE_8d43 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1158_l1154_l1150_l1145_l1142_DUPLICATE_8d43_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1145_c11_6f57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_left;
     BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output := BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1142_c11_11bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1169_c31_f589] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_return_output := CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1146_l1151_l1155_l1159_DUPLICATE_6eed LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1146_l1151_l1155_l1159_DUPLICATE_6eed_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1154_c11_c948] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_left;
     BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output := BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1166_l1154_DUPLICATE_7817 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1166_l1154_DUPLICATE_7817_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1129_c2_b857_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1166_c11_1c45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1129_l1166_l1154_l1150_l1145_l1142_DUPLICATE_2712 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1129_l1166_l1154_l1150_l1145_l1142_DUPLICATE_2712_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1166_l1154_l1150_l1145_l1142_DUPLICATE_5ff1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1166_l1154_l1150_l1145_l1142_DUPLICATE_5ff1_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1129_c2_b857_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1129_c6_1da7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1158_c11_6a5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1161_c30_75c8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_ins;
     sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_x;
     sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_return_output := sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1166_l1158_l1154_l1150_l1145_l1142_DUPLICATE_adc9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1166_l1158_l1154_l1150_l1145_l1142_DUPLICATE_adc9_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c6_1da7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_11bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_6f57_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_7a39_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_c948_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1158_c11_6a5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c11_1c45_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1146_l1151_l1155_l1159_DUPLICATE_6eed_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1146_l1151_l1155_l1159_DUPLICATE_6eed_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1146_l1151_l1155_l1159_DUPLICATE_6eed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1166_l1154_l1150_l1145_l1142_DUPLICATE_5ff1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1166_l1154_l1150_l1145_l1142_DUPLICATE_5ff1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1166_l1154_l1150_l1145_l1142_DUPLICATE_5ff1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1166_l1154_l1150_l1145_l1142_DUPLICATE_5ff1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1166_l1154_l1150_l1145_l1142_DUPLICATE_5ff1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1166_l1158_l1154_l1150_l1145_l1142_DUPLICATE_adc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1166_l1158_l1154_l1150_l1145_l1142_DUPLICATE_adc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1166_l1158_l1154_l1150_l1145_l1142_DUPLICATE_adc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1166_l1158_l1154_l1150_l1145_l1142_DUPLICATE_adc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1166_l1158_l1154_l1150_l1145_l1142_DUPLICATE_adc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1166_l1158_l1154_l1150_l1145_l1142_DUPLICATE_adc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1158_l1154_l1150_l1145_l1142_DUPLICATE_8d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1158_l1154_l1150_l1145_l1142_DUPLICATE_8d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1158_l1154_l1150_l1145_l1142_DUPLICATE_8d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1158_l1154_l1150_l1145_l1142_DUPLICATE_8d43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1158_l1154_l1150_l1145_l1142_DUPLICATE_8d43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1166_l1154_DUPLICATE_7817_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1166_l1154_DUPLICATE_7817_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1129_l1166_l1154_l1150_l1145_l1142_DUPLICATE_2712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1129_l1166_l1154_l1150_l1145_l1142_DUPLICATE_2712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1129_l1166_l1154_l1150_l1145_l1142_DUPLICATE_2712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1129_l1166_l1154_l1150_l1145_l1142_DUPLICATE_2712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1129_l1166_l1154_l1150_l1145_l1142_DUPLICATE_2712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1129_l1166_l1154_l1150_l1145_l1142_DUPLICATE_2712_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1129_c2_b857_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1129_c2_b857_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1129_c2_b857_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1129_c2_b857_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1161_c30_75c8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1158_c7_2a07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1166_c7_e01b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1166_c7_e01b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1151_c3_c524] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_left;
     BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_return_output := BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1166_c7_e01b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1159_c3_db9c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_left;
     BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_return_output := BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1169_c21_d6b1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1169_c21_d6b1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1169_c31_f589_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1151_c3_c524_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c3_db9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1169_c21_d6b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1147_DUPLICATE_2aaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1158_c7_2a07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1160_c11_f6ca] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_left;
     BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_return_output := BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1158_c7_2a07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1154_c7_3bff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1158_c7_2a07] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1166_c7_e01b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1158_c7_2a07] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond <= VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond;
     n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue;
     n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output := n16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;

     -- t16_MUX[uxn_opcodes_h_l1150_c7_1605] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1150_c7_1605_cond <= VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_cond;
     t16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue;
     t16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output := t16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1166_c7_e01b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1154_c7_3bff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1158_c7_2a07] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_cond;
     tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output := tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1154_c7_3bff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1164_c21_8c96] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1164_c21_8c96_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1160_c11_f6ca_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1154_c7_3bff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;

     -- n16_MUX[uxn_opcodes_h_l1154_c7_3bff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond;
     n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue;
     n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output := n16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;

     -- t16_MUX[uxn_opcodes_h_l1145_c7_11b3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond;
     t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue;
     t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output := t16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1150_c7_1605] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1164_c21_8c96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;
     -- n16_MUX[uxn_opcodes_h_l1150_c7_1605] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1150_c7_1605_cond <= VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_cond;
     n16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue;
     n16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output := n16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;

     -- t16_MUX[uxn_opcodes_h_l1142_c7_cf6f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond;
     t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue;
     t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output := t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1150_c7_1605] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1154_c7_3bff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_cond;
     tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output := tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1150_c7_1605] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1145_c7_11b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1158_c7_2a07] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output := result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1150_c7_1605] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1158_c7_2a07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;
     -- n16_MUX[uxn_opcodes_h_l1145_c7_11b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond;
     n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue;
     n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output := n16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1145_c7_11b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1145_c7_11b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1150_c7_1605] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_cond;
     tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output := tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1145_c7_11b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1154_c7_3bff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1142_c7_cf6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     t16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     t16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := t16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3bff_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;
     -- n16_MUX[uxn_opcodes_h_l1142_c7_cf6f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond;
     n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue;
     n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output := n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1145_c7_11b3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_cond;
     tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output := tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1150_c7_1605] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_return_output := result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1142_c7_cf6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1142_c7_cf6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1142_c7_cf6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_1605_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1145_c7_11b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1142_c7_cf6f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond;
     tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output := tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     n16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     n16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := n16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1145_c7_11b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1142_c7_cf6f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1142_c7_cf6f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1129_c2_b857] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_return_output := result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1173_l1125_DUPLICATE_5f5e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1173_l1125_DUPLICATE_5f5e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1129_c2_b857_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1129_c2_b857_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1173_l1125_DUPLICATE_5f5e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1173_l1125_DUPLICATE_5f5e_return_output;
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
