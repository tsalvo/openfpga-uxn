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
-- BIN_OP_EQ[uxn_opcodes_h_l876_c6_85b2]
signal BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal t16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l876_c2_a2b7]
signal n16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l889_c11_e2db]
signal BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l889_c7_251d]
signal tmp16_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l889_c7_251d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l889_c7_251d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l889_c7_251d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l889_c7_251d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l889_c7_251d]
signal result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l889_c7_251d]
signal t16_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l889_c7_251d]
signal n16_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l892_c11_f16d]
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l892_c7_45dc]
signal tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l892_c7_45dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l892_c7_45dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l892_c7_45dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l892_c7_45dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l892_c7_45dc]
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l892_c7_45dc]
signal t16_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l892_c7_45dc]
signal n16_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l897_c11_f54d]
signal BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l897_c7_8164]
signal tmp16_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l897_c7_8164]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l897_c7_8164]
signal result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l897_c7_8164]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l897_c7_8164]
signal result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l897_c7_8164]
signal result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l897_c7_8164]
signal t16_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l897_c7_8164]
signal n16_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l898_c3_5ad9]
signal BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l901_c11_eed5]
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l901_c7_73b7]
signal tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c7_73b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l901_c7_73b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c7_73b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l901_c7_73b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l901_c7_73b7]
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l901_c7_73b7]
signal n16_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l905_c11_4268]
signal BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l905_c7_5f50]
signal tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c7_5f50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l905_c7_5f50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c7_5f50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l905_c7_5f50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l905_c7_5f50]
signal result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l905_c7_5f50]
signal n16_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l906_c3_143b]
signal BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l907_c11_7b99]
signal BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l908_c30_3b3f]
signal sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l913_c11_5f94]
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_0fa9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_0fa9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l913_c7_0fa9]
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_0fa9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l916_c31_eaad]
signal CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e848( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2
BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_left,
BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_right,
BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7
tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7
result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7
result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7
result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- t16_MUX_uxn_opcodes_h_l876_c2_a2b7
t16_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
t16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- n16_MUX_uxn_opcodes_h_l876_c2_a2b7
n16_MUX_uxn_opcodes_h_l876_c2_a2b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond,
n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue,
n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse,
n16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db
BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_left,
BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_right,
BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l889_c7_251d
tmp16_MUX_uxn_opcodes_h_l889_c7_251d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l889_c7_251d_cond,
tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue,
tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse,
tmp16_MUX_uxn_opcodes_h_l889_c7_251d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d
result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d
result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d
result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d
result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_cond,
result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_return_output);

-- t16_MUX_uxn_opcodes_h_l889_c7_251d
t16_MUX_uxn_opcodes_h_l889_c7_251d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l889_c7_251d_cond,
t16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue,
t16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse,
t16_MUX_uxn_opcodes_h_l889_c7_251d_return_output);

-- n16_MUX_uxn_opcodes_h_l889_c7_251d
n16_MUX_uxn_opcodes_h_l889_c7_251d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l889_c7_251d_cond,
n16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue,
n16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse,
n16_MUX_uxn_opcodes_h_l889_c7_251d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d
BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_left,
BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_right,
BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l892_c7_45dc
tmp16_MUX_uxn_opcodes_h_l892_c7_45dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_cond,
tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc
result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_return_output);

-- t16_MUX_uxn_opcodes_h_l892_c7_45dc
t16_MUX_uxn_opcodes_h_l892_c7_45dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l892_c7_45dc_cond,
t16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue,
t16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse,
t16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output);

-- n16_MUX_uxn_opcodes_h_l892_c7_45dc
n16_MUX_uxn_opcodes_h_l892_c7_45dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l892_c7_45dc_cond,
n16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue,
n16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse,
n16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d
BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_left,
BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_right,
BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l897_c7_8164
tmp16_MUX_uxn_opcodes_h_l897_c7_8164 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l897_c7_8164_cond,
tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue,
tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse,
tmp16_MUX_uxn_opcodes_h_l897_c7_8164_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164
result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164
result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164
result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164
result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_cond,
result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_return_output);

-- t16_MUX_uxn_opcodes_h_l897_c7_8164
t16_MUX_uxn_opcodes_h_l897_c7_8164 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l897_c7_8164_cond,
t16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue,
t16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse,
t16_MUX_uxn_opcodes_h_l897_c7_8164_return_output);

-- n16_MUX_uxn_opcodes_h_l897_c7_8164
n16_MUX_uxn_opcodes_h_l897_c7_8164 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l897_c7_8164_cond,
n16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue,
n16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse,
n16_MUX_uxn_opcodes_h_l897_c7_8164_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9
BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_left,
BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_right,
BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5
BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_left,
BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_right,
BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l901_c7_73b7
tmp16_MUX_uxn_opcodes_h_l901_c7_73b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_cond,
tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7
result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_return_output);

-- n16_MUX_uxn_opcodes_h_l901_c7_73b7
n16_MUX_uxn_opcodes_h_l901_c7_73b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l901_c7_73b7_cond,
n16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue,
n16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse,
n16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268
BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_left,
BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_right,
BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output);

-- tmp16_MUX_uxn_opcodes_h_l905_c7_5f50
tmp16_MUX_uxn_opcodes_h_l905_c7_5f50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_cond,
tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue,
tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse,
tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50
result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50
result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50
result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_cond,
result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_return_output);

-- n16_MUX_uxn_opcodes_h_l905_c7_5f50
n16_MUX_uxn_opcodes_h_l905_c7_5f50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l905_c7_5f50_cond,
n16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue,
n16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse,
n16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l906_c3_143b
BIN_OP_OR_uxn_opcodes_h_l906_c3_143b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_left,
BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_right,
BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99
BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_left,
BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_right,
BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_return_output);

-- sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f
sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_ins,
sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_x,
sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_y,
sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94
BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_left,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_right,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9
result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_cond,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l916_c31_eaad
CONST_SR_8_uxn_opcodes_h_l916_c31_eaad : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_x,
CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1
CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 t16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 n16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output,
 tmp16_MUX_uxn_opcodes_h_l889_c7_251d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_return_output,
 t16_MUX_uxn_opcodes_h_l889_c7_251d_return_output,
 n16_MUX_uxn_opcodes_h_l889_c7_251d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output,
 tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_return_output,
 t16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output,
 n16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output,
 tmp16_MUX_uxn_opcodes_h_l897_c7_8164_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_return_output,
 t16_MUX_uxn_opcodes_h_l897_c7_8164_return_output,
 n16_MUX_uxn_opcodes_h_l897_c7_8164_return_output,
 BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output,
 tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_return_output,
 n16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output,
 tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_return_output,
 n16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output,
 BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_return_output,
 sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output,
 CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l881_c3_87f8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l886_c3_c28a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_1567 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_c6fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_32b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l907_c3_c61b : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_642f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c21_c52a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_7ae6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l914_c3_f204 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l916_c21_587b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l876_l913_l889_l897_l901_l892_DUPLICATE_c71f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l889_l897_l905_l901_l892_DUPLICATE_7aaa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l889_l897_l901_l892_DUPLICATE_f76f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l889_l897_l905_l901_l892_DUPLICATE_ef80_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l898_l893_l902_l906_DUPLICATE_64b2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l901_l913_DUPLICATE_7ddc_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l920_l872_DUPLICATE_44a9_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_1567 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_1567;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l914_c3_f204 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l914_c3_f204;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l886_c3_c28a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l886_c3_c28a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_32b1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_32b1;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_c6fd := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_c6fd;
     VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_7ae6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_7ae6;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l881_c3_87f8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l881_c3_87f8;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_642f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_642f;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse := tmp16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l905_c11_4268] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_left;
     BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output := BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l908_c30_3b3f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_ins;
     sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_x;
     sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_return_output := sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l916_c31_eaad] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_x <= VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_return_output := CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l897_c11_f54d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_left;
     BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output := BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l892_c11_f16d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_left;
     BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output := BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l898_l893_l902_l906_DUPLICATE_64b2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l898_l893_l902_l906_DUPLICATE_64b2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l889_l897_l905_l901_l892_DUPLICATE_7aaa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l889_l897_l905_l901_l892_DUPLICATE_7aaa_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l876_l913_l889_l897_l901_l892_DUPLICATE_c71f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l876_l913_l889_l897_l901_l892_DUPLICATE_c71f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l901_c11_eed5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_left;
     BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output := BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l889_l897_l905_l901_l892_DUPLICATE_ef80 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l889_l897_l905_l901_l892_DUPLICATE_ef80_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l913_c11_5f94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_left;
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_return_output := BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l901_l913_DUPLICATE_7ddc LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l901_l913_DUPLICATE_7ddc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l889_c11_e2db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_left;
     BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output := BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l876_c6_85b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l889_l897_l901_l892_DUPLICATE_f76f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l889_l897_l901_l892_DUPLICATE_f76f_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_85b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_e2db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_f16d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_f54d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_eed5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_4268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_5f94_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l898_l893_l902_l906_DUPLICATE_64b2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l898_l893_l902_l906_DUPLICATE_64b2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l898_l893_l902_l906_DUPLICATE_64b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l889_l897_l901_l892_DUPLICATE_f76f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l889_l897_l901_l892_DUPLICATE_f76f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l889_l897_l901_l892_DUPLICATE_f76f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l889_l897_l901_l892_DUPLICATE_f76f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l913_l889_l897_l901_l892_DUPLICATE_f76f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l889_l897_l905_l901_l892_DUPLICATE_ef80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l889_l897_l905_l901_l892_DUPLICATE_ef80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l889_l897_l905_l901_l892_DUPLICATE_ef80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l889_l897_l905_l901_l892_DUPLICATE_ef80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l889_l897_l905_l901_l892_DUPLICATE_ef80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l913_l889_l897_l905_l901_l892_DUPLICATE_ef80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l889_l897_l905_l901_l892_DUPLICATE_7aaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l889_l897_l905_l901_l892_DUPLICATE_7aaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l889_l897_l905_l901_l892_DUPLICATE_7aaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l889_l897_l905_l901_l892_DUPLICATE_7aaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l889_l897_l905_l901_l892_DUPLICATE_7aaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l901_l913_DUPLICATE_7ddc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l901_l913_DUPLICATE_7ddc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l876_l913_l889_l897_l901_l892_DUPLICATE_c71f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l876_l913_l889_l897_l901_l892_DUPLICATE_c71f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l876_l913_l889_l897_l901_l892_DUPLICATE_c71f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l876_l913_l889_l897_l901_l892_DUPLICATE_c71f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l876_l913_l889_l897_l901_l892_DUPLICATE_c71f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l876_l913_l889_l897_l901_l892_DUPLICATE_c71f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l876_c2_a2b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_3b3f_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_0fa9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l898_c3_5ad9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_left;
     BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_return_output := BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_0fa9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_0fa9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l906_c3_143b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_left;
     BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_return_output := BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l905_c7_5f50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l916_c21_587b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l916_c21_587b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_eaad_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_5ad9_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_right := VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_143b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l916_c21_587b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_f3c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l913_c7_0fa9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output := result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l905_c7_5f50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l901_c7_73b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l907_c11_7b99] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_left;
     BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_return_output := BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c7_5f50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;

     -- t16_MUX[uxn_opcodes_h_l897_c7_8164] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l897_c7_8164_cond <= VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_cond;
     t16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue;
     t16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_return_output := t16_MUX_uxn_opcodes_h_l897_c7_8164_return_output;

     -- n16_MUX[uxn_opcodes_h_l905_c7_5f50] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l905_c7_5f50_cond <= VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_cond;
     n16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue;
     n16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output := n16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c7_5f50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l907_c3_c61b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_7b99_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_0fa9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l897_c7_8164_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue := VAR_tmp16_uxn_opcodes_h_l907_c3_c61b;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l897_c7_8164] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c7_73b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l901_c7_73b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l905_c7_5f50] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_cond;
     tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue;
     tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output := tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;

     -- n16_MUX[uxn_opcodes_h_l901_c7_73b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l901_c7_73b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_cond;
     n16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue;
     n16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output := n16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l911_c21_c52a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c21_c52a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l907_c3_c61b);

     -- t16_MUX[uxn_opcodes_h_l892_c7_45dc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l892_c7_45dc_cond <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_cond;
     t16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue;
     t16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output := t16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c7_73b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c21_c52a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse := VAR_n16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_8164_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l897_c7_8164] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l905_c7_5f50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_return_output := result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l897_c7_8164] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_return_output;

     -- n16_MUX[uxn_opcodes_h_l897_c7_8164] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l897_c7_8164_cond <= VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_cond;
     n16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue;
     n16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_return_output := n16_MUX_uxn_opcodes_h_l897_c7_8164_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l892_c7_45dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l897_c7_8164] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_return_output;

     -- t16_MUX[uxn_opcodes_h_l889_c7_251d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l889_c7_251d_cond <= VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_cond;
     t16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue;
     t16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_return_output := t16_MUX_uxn_opcodes_h_l889_c7_251d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l901_c7_73b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_cond;
     tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output := tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l897_c7_8164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_8164_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_8164_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_8164_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_5f50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l889_c7_251d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l889_c7_251d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l901_c7_73b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l892_c7_45dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l897_c7_8164] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l897_c7_8164_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_cond;
     tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iftrue;
     tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_return_output := tmp16_MUX_uxn_opcodes_h_l897_c7_8164_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l892_c7_45dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l892_c7_45dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;

     -- t16_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := t16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l892_c7_45dc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l892_c7_45dc_cond <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_cond;
     n16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue;
     n16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output := n16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_251d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_73b7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_8164_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l889_c7_251d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l892_c7_45dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_cond;
     tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output := tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l889_c7_251d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l889_c7_251d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l897_c7_8164] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_cond;
     result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_return_output := result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_return_output;

     -- n16_MUX[uxn_opcodes_h_l889_c7_251d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l889_c7_251d_cond <= VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_cond;
     n16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue;
     n16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_return_output := n16_MUX_uxn_opcodes_h_l889_c7_251d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l889_c7_251d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_251d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_251d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_251d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_8164_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l889_c7_251d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l889_c7_251d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_cond;
     tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_return_output := tmp16_MUX_uxn_opcodes_h_l889_c7_251d_return_output;

     -- n16_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := n16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l892_c7_45dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_45dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_251d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l889_c7_251d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_return_output := result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_251d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l876_c2_a2b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l920_l872_DUPLICATE_44a9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l920_l872_DUPLICATE_44a9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_a2b7_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l920_l872_DUPLICATE_44a9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l920_l872_DUPLICATE_44a9_return_output;
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
