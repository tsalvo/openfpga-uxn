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
entity add2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_50b92fe2;
architecture arch of add2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l871_c6_8ad7]
signal BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l871_c2_0737]
signal n16_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l871_c2_0737]
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l871_c2_0737]
signal result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l871_c2_0737]
signal result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l871_c2_0737]
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l871_c2_0737]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l871_c2_0737]
signal result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l871_c2_0737]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l871_c2_0737]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l871_c2_0737]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l871_c2_0737]
signal tmp16_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l871_c2_0737]
signal t16_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l884_c11_f9ad]
signal BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l884_c7_f26d]
signal n16_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l884_c7_f26d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l884_c7_f26d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l884_c7_f26d]
signal result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l884_c7_f26d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l884_c7_f26d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l884_c7_f26d]
signal tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l884_c7_f26d]
signal t16_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l887_c11_cfd3]
signal BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l887_c7_5c3b]
signal n16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l887_c7_5c3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l887_c7_5c3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l887_c7_5c3b]
signal result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l887_c7_5c3b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l887_c7_5c3b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l887_c7_5c3b]
signal tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l887_c7_5c3b]
signal t16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l892_c11_00b2]
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l892_c7_c4ba]
signal n16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l892_c7_c4ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l892_c7_c4ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l892_c7_c4ba]
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l892_c7_c4ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l892_c7_c4ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l892_c7_c4ba]
signal tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l892_c7_c4ba]
signal t16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l893_c3_361e]
signal BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l896_c11_c5d1]
signal BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l896_c7_1d03]
signal n16_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l896_c7_1d03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l896_c7_1d03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l896_c7_1d03]
signal result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l896_c7_1d03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l896_c7_1d03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l896_c7_1d03]
signal tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l900_c11_c3a5]
signal BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l900_c7_9212]
signal n16_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l900_c7_9212]
signal result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l900_c7_9212]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l900_c7_9212]
signal result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l900_c7_9212]
signal result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l900_c7_9212]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l900_c7_9212]
signal tmp16_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l901_c3_b3b3]
signal BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l902_c11_1e3c]
signal BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l903_c30_4fbc]
signal sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l908_c11_9a33]
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l908_c7_6730]
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l908_c7_6730]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l908_c7_6730]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l908_c7_6730]
signal result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l911_c31_33b6]
signal CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7
BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_left,
BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_right,
BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output);

-- n16_MUX_uxn_opcodes_h_l871_c2_0737
n16_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l871_c2_0737_cond,
n16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
n16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
n16_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737
result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737
result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737
result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737
result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737
result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_cond,
result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737
result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- tmp16_MUX_uxn_opcodes_h_l871_c2_0737
tmp16_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l871_c2_0737_cond,
tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
tmp16_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- t16_MUX_uxn_opcodes_h_l871_c2_0737
t16_MUX_uxn_opcodes_h_l871_c2_0737 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l871_c2_0737_cond,
t16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue,
t16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse,
t16_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad
BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_left,
BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_right,
BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output);

-- n16_MUX_uxn_opcodes_h_l884_c7_f26d
n16_MUX_uxn_opcodes_h_l884_c7_f26d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l884_c7_f26d_cond,
n16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue,
n16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse,
n16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d
result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d
result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_cond,
result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d
result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d
result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l884_c7_f26d
tmp16_MUX_uxn_opcodes_h_l884_c7_f26d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_cond,
tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue,
tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse,
tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output);

-- t16_MUX_uxn_opcodes_h_l884_c7_f26d
t16_MUX_uxn_opcodes_h_l884_c7_f26d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l884_c7_f26d_cond,
t16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue,
t16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse,
t16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3
BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_left,
BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_right,
BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output);

-- n16_MUX_uxn_opcodes_h_l887_c7_5c3b
n16_MUX_uxn_opcodes_h_l887_c7_5c3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond,
n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue,
n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse,
n16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b
result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_cond,
result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b
result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b
tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond,
tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue,
tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse,
tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output);

-- t16_MUX_uxn_opcodes_h_l887_c7_5c3b
t16_MUX_uxn_opcodes_h_l887_c7_5c3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond,
t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue,
t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse,
t16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2
BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_left,
BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_right,
BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output);

-- n16_MUX_uxn_opcodes_h_l892_c7_c4ba
n16_MUX_uxn_opcodes_h_l892_c7_c4ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond,
n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue,
n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse,
n16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba
result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_cond,
result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output);

-- tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba
tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond,
tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue,
tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse,
tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output);

-- t16_MUX_uxn_opcodes_h_l892_c7_c4ba
t16_MUX_uxn_opcodes_h_l892_c7_c4ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond,
t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue,
t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse,
t16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l893_c3_361e
BIN_OP_OR_uxn_opcodes_h_l893_c3_361e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_left,
BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_right,
BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1
BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_left,
BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_right,
BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output);

-- n16_MUX_uxn_opcodes_h_l896_c7_1d03
n16_MUX_uxn_opcodes_h_l896_c7_1d03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l896_c7_1d03_cond,
n16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue,
n16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse,
n16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03
result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03
result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_cond,
result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03
result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03
result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_return_output);

-- tmp16_MUX_uxn_opcodes_h_l896_c7_1d03
tmp16_MUX_uxn_opcodes_h_l896_c7_1d03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_cond,
tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue,
tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse,
tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5
BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_left,
BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_right,
BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output);

-- n16_MUX_uxn_opcodes_h_l900_c7_9212
n16_MUX_uxn_opcodes_h_l900_c7_9212 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l900_c7_9212_cond,
n16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue,
n16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse,
n16_MUX_uxn_opcodes_h_l900_c7_9212_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212
result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212
result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_cond,
result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212
result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212
result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_return_output);

-- tmp16_MUX_uxn_opcodes_h_l900_c7_9212
tmp16_MUX_uxn_opcodes_h_l900_c7_9212 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l900_c7_9212_cond,
tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue,
tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse,
tmp16_MUX_uxn_opcodes_h_l900_c7_9212_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3
BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_left,
BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_right,
BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c
BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_left,
BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_right,
BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc
sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_ins,
sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_x,
sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_y,
sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33
BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_left,
BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_right,
BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730
result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_cond,
result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_return_output);

-- CONST_SR_8_uxn_opcodes_h_l911_c31_33b6
CONST_SR_8_uxn_opcodes_h_l911_c31_33b6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_x,
CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7
CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output,
 n16_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 tmp16_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 t16_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output,
 n16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_return_output,
 tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output,
 t16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output,
 n16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output,
 tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output,
 t16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output,
 n16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output,
 tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output,
 t16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output,
 BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output,
 n16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_return_output,
 tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output,
 n16_MUX_uxn_opcodes_h_l900_c7_9212_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_return_output,
 tmp16_MUX_uxn_opcodes_h_l900_c7_9212_return_output,
 BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_return_output,
 sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_return_output,
 CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l881_c3_b03a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l876_c3_5805 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_c2f1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_6753 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l894_c3_b3b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_2c14 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l902_c3_1848 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l906_c21_1f89_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_de95 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_6011 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c21_0a28_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l892_l871_l908_l884_l896_l887_DUPLICATE_e2b9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_l900_DUPLICATE_fddd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l892_l884_l896_l887_l900_DUPLICATE_3718_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_DUPLICATE_aaf7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l888_l901_l893_l897_DUPLICATE_2190_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l896_l908_DUPLICATE_850b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l915_l867_DUPLICATE_e20f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_de95 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_de95;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_c2f1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_c2f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l876_c3_5805 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l876_c3_5805;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_2c14 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_2c14;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l894_c3_b3b3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l894_c3_b3b3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_6011 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_6011;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l881_c3_b03a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l881_c3_b03a;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_6753 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_6753;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse := tmp16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l896_l908_DUPLICATE_850b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l896_l908_DUPLICATE_850b_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_DUPLICATE_aaf7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_DUPLICATE_aaf7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l896_c11_c5d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l911_c31_33b6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_return_output := CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l871_c6_8ad7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_left;
     BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output := BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l888_l901_l893_l897_DUPLICATE_2190 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l888_l901_l893_l897_DUPLICATE_2190_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l903_c30_4fbc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_ins;
     sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_x;
     sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_return_output := sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l871_c2_0737_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l892_c11_00b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l892_l871_l908_l884_l896_l887_DUPLICATE_e2b9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l892_l871_l908_l884_l896_l887_DUPLICATE_e2b9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l884_c11_f9ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l892_l884_l896_l887_l900_DUPLICATE_3718 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l892_l884_l896_l887_l900_DUPLICATE_3718_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l871_c2_0737_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l871_c2_0737_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l908_c11_9a33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_left;
     BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_return_output := BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_l900_DUPLICATE_fddd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_l900_DUPLICATE_fddd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l887_c11_cfd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l900_c11_c3a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l871_c2_0737_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l871_c6_8ad7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_f9ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_cfd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_00b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c5d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_c3a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_9a33_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l888_l901_l893_l897_DUPLICATE_2190_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l888_l901_l893_l897_DUPLICATE_2190_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l888_l901_l893_l897_DUPLICATE_2190_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_DUPLICATE_aaf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_DUPLICATE_aaf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_DUPLICATE_aaf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_DUPLICATE_aaf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_DUPLICATE_aaf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_l900_DUPLICATE_fddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_l900_DUPLICATE_fddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_l900_DUPLICATE_fddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_l900_DUPLICATE_fddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_l900_DUPLICATE_fddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l892_l908_l884_l896_l887_l900_DUPLICATE_fddd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l892_l884_l896_l887_l900_DUPLICATE_3718_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l892_l884_l896_l887_l900_DUPLICATE_3718_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l892_l884_l896_l887_l900_DUPLICATE_3718_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l892_l884_l896_l887_l900_DUPLICATE_3718_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l892_l884_l896_l887_l900_DUPLICATE_3718_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l896_l908_DUPLICATE_850b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l896_l908_DUPLICATE_850b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l892_l871_l908_l884_l896_l887_DUPLICATE_e2b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l892_l871_l908_l884_l896_l887_DUPLICATE_e2b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l892_l871_l908_l884_l896_l887_DUPLICATE_e2b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l892_l871_l908_l884_l896_l887_DUPLICATE_e2b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l892_l871_l908_l884_l896_l887_DUPLICATE_e2b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l892_l871_l908_l884_l896_l887_DUPLICATE_e2b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l871_c2_0737_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l871_c2_0737_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l871_c2_0737_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l871_c2_0737_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l903_c30_4fbc_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l911_c21_0a28] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c21_0a28_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l911_c31_33b6_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l908_c7_6730] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l908_c7_6730] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l900_c7_9212] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l893_c3_361e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_left;
     BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_return_output := BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l908_c7_6730] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l901_c3_b3b3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_left;
     BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_return_output := BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l893_c3_361e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_right := VAR_BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l901_c3_b3b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c21_0a28_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l898_l889_DUPLICATE_6fb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_6730_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_9212_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_6730_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_6730_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l896_c7_1d03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;

     -- t16_MUX[uxn_opcodes_h_l892_c7_c4ba] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond;
     t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue;
     t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output := t16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l900_c7_9212] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_return_output;

     -- n16_MUX[uxn_opcodes_h_l900_c7_9212] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l900_c7_9212_cond <= VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_cond;
     n16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue;
     n16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_return_output := n16_MUX_uxn_opcodes_h_l900_c7_9212_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l900_c7_9212] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l908_c7_6730] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_cond;
     result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_return_output := result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l900_c7_9212] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l902_c11_1e3c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l902_c3_1848 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l902_c11_1e3c_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse := VAR_n16_MUX_uxn_opcodes_h_l900_c7_9212_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_9212_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_9212_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_9212_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_6730_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue := VAR_tmp16_uxn_opcodes_h_l902_c3_1848;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l896_c7_1d03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l896_c7_1d03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l896_c7_1d03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;

     -- t16_MUX[uxn_opcodes_h_l887_c7_5c3b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond <= VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond;
     t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue;
     t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output := t16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l906_c21_1f89] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l906_c21_1f89_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l902_c3_1848);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l892_c7_c4ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l900_c7_9212] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l900_c7_9212_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_cond;
     tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iftrue;
     tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_return_output := tmp16_MUX_uxn_opcodes_h_l900_c7_9212_return_output;

     -- n16_MUX[uxn_opcodes_h_l896_c7_1d03] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l896_c7_1d03_cond <= VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_cond;
     n16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue;
     n16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output := n16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l906_c21_1f89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse := VAR_n16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_9212_return_output;
     -- n16_MUX[uxn_opcodes_h_l892_c7_c4ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond;
     n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue;
     n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output := n16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l896_c7_1d03] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_cond;
     tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue;
     tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output := tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l892_c7_c4ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l900_c7_9212] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_cond;
     result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_return_output := result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l892_c7_c4ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l887_c7_5c3b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;

     -- t16_MUX[uxn_opcodes_h_l884_c7_f26d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l884_c7_f26d_cond <= VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_cond;
     t16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue;
     t16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output := t16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l892_c7_c4ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_9212_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_t16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l887_c7_5c3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l887_c7_5c3b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l884_c7_f26d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;

     -- n16_MUX[uxn_opcodes_h_l887_c7_5c3b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond <= VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond;
     n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue;
     n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output := n16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l896_c7_1d03] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_cond;
     result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_return_output := result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l887_c7_5c3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l892_c7_c4ba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_cond;
     tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue;
     tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output := tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;

     -- t16_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     t16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     t16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_return_output := t16_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l896_c7_1d03_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l871_c2_0737_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l884_c7_f26d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l892_c7_c4ba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output := result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l884_c7_f26d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l887_c7_5c3b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_cond;
     tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output := tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;

     -- n16_MUX[uxn_opcodes_h_l884_c7_f26d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l884_c7_f26d_cond <= VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_cond;
     n16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue;
     n16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output := n16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l884_c7_f26d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_n16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_c4ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- n16_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     n16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     n16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_return_output := n16_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l887_c7_5c3b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output := result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l884_c7_f26d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_cond;
     tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output := tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l871_c2_0737_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l887_c7_5c3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l884_c7_f26d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_return_output := result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_return_output := tmp16_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l884_c7_f26d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l871_c2_0737_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l871_c2_0737] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_cond;
     result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_return_output := result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l915_l867_DUPLICATE_e20f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l915_l867_DUPLICATE_e20f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l871_c2_0737_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l871_c2_0737_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l915_l867_DUPLICATE_e20f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l915_l867_DUPLICATE_e20f_return_output;
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
