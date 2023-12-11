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
-- BIN_OP_EQ[uxn_opcodes_h_l876_c6_3286]
signal BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l876_c2_af07]
signal tmp16_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l876_c2_af07]
signal t16_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l876_c2_af07]
signal n16_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l876_c2_af07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l876_c2_af07]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l876_c2_af07]
signal result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l876_c2_af07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l876_c2_af07]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l876_c2_af07]
signal result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l876_c2_af07]
signal result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l876_c2_af07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l876_c2_af07]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l889_c11_8802]
signal BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l889_c7_3ca1]
signal tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l889_c7_3ca1]
signal t16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l889_c7_3ca1]
signal n16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l889_c7_3ca1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l889_c7_3ca1]
signal result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l889_c7_3ca1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l889_c7_3ca1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l889_c7_3ca1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l892_c11_30fe]
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l892_c7_238a]
signal tmp16_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l892_c7_238a]
signal t16_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l892_c7_238a]
signal n16_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l892_c7_238a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l892_c7_238a]
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l892_c7_238a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l892_c7_238a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l892_c7_238a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l897_c11_180d]
signal BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l897_c7_7e60]
signal tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l897_c7_7e60]
signal t16_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l897_c7_7e60]
signal n16_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l897_c7_7e60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l897_c7_7e60]
signal result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l897_c7_7e60]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l897_c7_7e60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l897_c7_7e60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l898_c3_62a6]
signal BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l901_c11_a9cd]
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l901_c7_db28]
signal tmp16_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l901_c7_db28]
signal n16_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l901_c7_db28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l901_c7_db28]
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c7_db28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c7_db28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l901_c7_db28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l905_c11_1adb]
signal BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l905_c7_ac49]
signal tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l905_c7_ac49]
signal n16_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l905_c7_ac49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l905_c7_ac49]
signal result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c7_ac49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c7_ac49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l905_c7_ac49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l906_c3_f04a]
signal BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l907_c11_e36e]
signal BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l908_c30_49ff]
signal sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l913_c11_f4fc]
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l913_c7_d61f]
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_d61f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_d61f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_d61f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l916_c31_b909]
signal CONST_SR_8_uxn_opcodes_h_l916_c31_b909_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l916_c31_b909_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286
BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_left,
BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_right,
BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output);

-- tmp16_MUX_uxn_opcodes_h_l876_c2_af07
tmp16_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l876_c2_af07_cond,
tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
tmp16_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- t16_MUX_uxn_opcodes_h_l876_c2_af07
t16_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l876_c2_af07_cond,
t16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
t16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
t16_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- n16_MUX_uxn_opcodes_h_l876_c2_af07
n16_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l876_c2_af07_cond,
n16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
n16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
n16_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07
result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07
result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07
result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_cond,
result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802
BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_left,
BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_right,
BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output);

-- tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1
tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond,
tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue,
tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse,
tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output);

-- t16_MUX_uxn_opcodes_h_l889_c7_3ca1
t16_MUX_uxn_opcodes_h_l889_c7_3ca1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond,
t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue,
t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse,
t16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output);

-- n16_MUX_uxn_opcodes_h_l889_c7_3ca1
n16_MUX_uxn_opcodes_h_l889_c7_3ca1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond,
n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue,
n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse,
n16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1
result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1
result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_cond,
result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1
result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1
result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe
BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_left,
BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_right,
BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l892_c7_238a
tmp16_MUX_uxn_opcodes_h_l892_c7_238a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l892_c7_238a_cond,
tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue,
tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse,
tmp16_MUX_uxn_opcodes_h_l892_c7_238a_return_output);

-- t16_MUX_uxn_opcodes_h_l892_c7_238a
t16_MUX_uxn_opcodes_h_l892_c7_238a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l892_c7_238a_cond,
t16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue,
t16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse,
t16_MUX_uxn_opcodes_h_l892_c7_238a_return_output);

-- n16_MUX_uxn_opcodes_h_l892_c7_238a
n16_MUX_uxn_opcodes_h_l892_c7_238a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l892_c7_238a_cond,
n16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue,
n16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse,
n16_MUX_uxn_opcodes_h_l892_c7_238a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a
result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_cond,
result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d
BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_left,
BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_right,
BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l897_c7_7e60
tmp16_MUX_uxn_opcodes_h_l897_c7_7e60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_cond,
tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue,
tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse,
tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output);

-- t16_MUX_uxn_opcodes_h_l897_c7_7e60
t16_MUX_uxn_opcodes_h_l897_c7_7e60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l897_c7_7e60_cond,
t16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue,
t16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse,
t16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output);

-- n16_MUX_uxn_opcodes_h_l897_c7_7e60
n16_MUX_uxn_opcodes_h_l897_c7_7e60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l897_c7_7e60_cond,
n16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue,
n16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse,
n16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60
result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60
result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_cond,
result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60
result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60
result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6
BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_left,
BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_right,
BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd
BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_left,
BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_right,
BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l901_c7_db28
tmp16_MUX_uxn_opcodes_h_l901_c7_db28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l901_c7_db28_cond,
tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue,
tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse,
tmp16_MUX_uxn_opcodes_h_l901_c7_db28_return_output);

-- n16_MUX_uxn_opcodes_h_l901_c7_db28
n16_MUX_uxn_opcodes_h_l901_c7_db28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l901_c7_db28_cond,
n16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue,
n16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse,
n16_MUX_uxn_opcodes_h_l901_c7_db28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28
result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_cond,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb
BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_left,
BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_right,
BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l905_c7_ac49
tmp16_MUX_uxn_opcodes_h_l905_c7_ac49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_cond,
tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue,
tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse,
tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output);

-- n16_MUX_uxn_opcodes_h_l905_c7_ac49
n16_MUX_uxn_opcodes_h_l905_c7_ac49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l905_c7_ac49_cond,
n16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue,
n16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse,
n16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49
result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49
result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_cond,
result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49
result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a
BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_left,
BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_right,
BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e
BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_left,
BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_right,
BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l908_c30_49ff
sp_relative_shift_uxn_opcodes_h_l908_c30_49ff : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_ins,
sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_x,
sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_y,
sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc
BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_left,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_right,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f
result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_cond,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l916_c31_b909
CONST_SR_8_uxn_opcodes_h_l916_c31_b909 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l916_c31_b909_x,
CONST_SR_8_uxn_opcodes_h_l916_c31_b909_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f
CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output,
 tmp16_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 t16_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 n16_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output,
 tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output,
 t16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output,
 n16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output,
 tmp16_MUX_uxn_opcodes_h_l892_c7_238a_return_output,
 t16_MUX_uxn_opcodes_h_l892_c7_238a_return_output,
 n16_MUX_uxn_opcodes_h_l892_c7_238a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output,
 tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output,
 t16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output,
 n16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_return_output,
 BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output,
 tmp16_MUX_uxn_opcodes_h_l901_c7_db28_return_output,
 n16_MUX_uxn_opcodes_h_l901_c7_db28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output,
 tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output,
 n16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_return_output,
 BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_return_output,
 sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_return_output,
 CONST_SR_8_uxn_opcodes_h_l916_c31_b909_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l881_c3_c158 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l886_c3_9179 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_ae8e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_031b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_1630 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l907_c3_d05c : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_727c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c21_2e09_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l914_c3_7b13 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_1dee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_b909_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_b909_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l916_c21_d668_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l897_l892_l901_l876_l913_l889_DUPLICATE_d6f2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l897_l892_l905_l901_l913_l889_DUPLICATE_295a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l897_l892_l901_l913_l889_DUPLICATE_94d1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l897_l892_l905_l901_l889_DUPLICATE_7b0a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l893_l902_l898_l906_DUPLICATE_f45d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l901_l913_DUPLICATE_4e89_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l920_l872_DUPLICATE_9294_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l914_c3_7b13 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l914_c3_7b13;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l886_c3_9179 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l886_c3_9179;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_ae8e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_ae8e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_1630 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_1630;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_031b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_031b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l881_c3_c158 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l881_c3_c158;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_1dee := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_1dee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_727c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l910_c3_727c;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_b909_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l889_c11_8802] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_left;
     BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output := BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l913_c11_f4fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l897_l892_l905_l901_l913_l889_DUPLICATE_295a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l897_l892_l905_l901_l913_l889_DUPLICATE_295a_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l897_l892_l905_l901_l889_DUPLICATE_7b0a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l897_l892_l905_l901_l889_DUPLICATE_7b0a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l905_c11_1adb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_left;
     BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output := BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l901_l913_DUPLICATE_4e89 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l901_l913_DUPLICATE_4e89_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l876_c2_af07_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l908_c30_49ff] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_ins;
     sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_x <= VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_x;
     sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_y <= VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_return_output := sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l897_l892_l901_l913_l889_DUPLICATE_94d1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l897_l892_l901_l913_l889_DUPLICATE_94d1_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l876_c2_af07_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l892_c11_30fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l893_l902_l898_l906_DUPLICATE_f45d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l893_l902_l898_l906_DUPLICATE_f45d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l916_c31_b909] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l916_c31_b909_x <= VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_b909_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_b909_return_output := CONST_SR_8_uxn_opcodes_h_l916_c31_b909_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l897_l892_l901_l876_l913_l889_DUPLICATE_d6f2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l897_l892_l901_l876_l913_l889_DUPLICATE_d6f2_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l876_c6_3286] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_left;
     BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output := BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l876_c2_af07_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l897_c11_180d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_left;
     BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output := BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l876_c2_af07_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l901_c11_a9cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c6_3286_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l889_c11_8802_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_30fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l897_c11_180d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_a9cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c11_1adb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_f4fc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l893_l902_l898_l906_DUPLICATE_f45d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l893_l902_l898_l906_DUPLICATE_f45d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l893_l902_l898_l906_DUPLICATE_f45d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l897_l892_l901_l913_l889_DUPLICATE_94d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l897_l892_l901_l913_l889_DUPLICATE_94d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l897_l892_l901_l913_l889_DUPLICATE_94d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l897_l892_l901_l913_l889_DUPLICATE_94d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l897_l892_l901_l913_l889_DUPLICATE_94d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l897_l892_l905_l901_l913_l889_DUPLICATE_295a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l897_l892_l905_l901_l913_l889_DUPLICATE_295a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l897_l892_l905_l901_l913_l889_DUPLICATE_295a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l897_l892_l905_l901_l913_l889_DUPLICATE_295a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l897_l892_l905_l901_l913_l889_DUPLICATE_295a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l897_l892_l905_l901_l913_l889_DUPLICATE_295a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l897_l892_l905_l901_l889_DUPLICATE_7b0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l897_l892_l905_l901_l889_DUPLICATE_7b0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l897_l892_l905_l901_l889_DUPLICATE_7b0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l897_l892_l905_l901_l889_DUPLICATE_7b0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l897_l892_l905_l901_l889_DUPLICATE_7b0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l901_l913_DUPLICATE_4e89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l901_l913_DUPLICATE_4e89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l897_l892_l901_l876_l913_l889_DUPLICATE_d6f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l897_l892_l901_l876_l913_l889_DUPLICATE_d6f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l897_l892_l901_l876_l913_l889_DUPLICATE_d6f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l897_l892_l901_l876_l913_l889_DUPLICATE_d6f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l897_l892_l901_l876_l913_l889_DUPLICATE_d6f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l897_l892_l901_l876_l913_l889_DUPLICATE_d6f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l876_c2_af07_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l876_c2_af07_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l876_c2_af07_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l876_c2_af07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l908_c30_49ff_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l905_c7_ac49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l916_c21_d668] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l916_c21_d668_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l916_c31_b909_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l898_c3_62a6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_left;
     BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_return_output := BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_d61f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_d61f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_d61f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l906_c3_f04a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_left;
     BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_return_output := BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l898_c3_62a6_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_right := VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l906_c3_f04a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l916_c21_d668_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l894_l903_DUPLICATE_e23f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_d61f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_d61f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_d61f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l905_c7_ac49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c7_ac49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l901_c7_db28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c7_ac49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l907_c11_e36e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_return_output;

     -- t16_MUX[uxn_opcodes_h_l897_c7_7e60] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l897_c7_7e60_cond <= VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_cond;
     t16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue;
     t16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output := t16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l913_c7_d61f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_return_output := result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_return_output;

     -- n16_MUX[uxn_opcodes_h_l905_c7_ac49] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l905_c7_ac49_cond <= VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_cond;
     n16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue;
     n16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output := n16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l907_c3_d05c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l907_c11_e36e_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse := VAR_n16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_db28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_d61f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue := VAR_tmp16_uxn_opcodes_h_l907_c3_d05c;
     -- n16_MUX[uxn_opcodes_h_l901_c7_db28] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l901_c7_db28_cond <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_cond;
     n16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue;
     n16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_return_output := n16_MUX_uxn_opcodes_h_l901_c7_db28_return_output;

     -- t16_MUX[uxn_opcodes_h_l892_c7_238a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l892_c7_238a_cond <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_cond;
     t16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue;
     t16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_return_output := t16_MUX_uxn_opcodes_h_l892_c7_238a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l901_c7_db28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l897_c7_7e60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l905_c7_ac49] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_cond;
     tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue;
     tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output := tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c7_db28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c7_db28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l911_c21_2e09] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c21_2e09_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l907_c3_d05c);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l911_c21_2e09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse := VAR_n16_MUX_uxn_opcodes_h_l901_c7_db28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_db28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_db28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_db28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l892_c7_238a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l897_c7_7e60] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l901_c7_db28] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l901_c7_db28_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_cond;
     tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iftrue;
     tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_return_output := tmp16_MUX_uxn_opcodes_h_l901_c7_db28_return_output;

     -- n16_MUX[uxn_opcodes_h_l897_c7_7e60] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l897_c7_7e60_cond <= VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_cond;
     n16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue;
     n16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output := n16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;

     -- t16_MUX[uxn_opcodes_h_l889_c7_3ca1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond <= VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond;
     t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue;
     t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output := t16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l897_c7_7e60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l905_c7_ac49] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_cond;
     result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_return_output := result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l892_c7_238a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l897_c7_7e60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_238a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c7_ac49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_t16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_db28_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l897_c7_7e60] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_cond;
     tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue;
     tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output := tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;

     -- t16_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     t16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     t16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_return_output := t16_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l892_c7_238a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l901_c7_db28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_cond;
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_return_output := result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l889_c7_3ca1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l892_c7_238a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l892_c7_238a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_return_output;

     -- n16_MUX[uxn_opcodes_h_l892_c7_238a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l892_c7_238a_cond <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_cond;
     n16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue;
     n16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_return_output := n16_MUX_uxn_opcodes_h_l892_c7_238a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l892_c7_238a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_238a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_238a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_238a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_db28_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l876_c2_af07_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l892_c7_238a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l892_c7_238a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_cond;
     tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_return_output := tmp16_MUX_uxn_opcodes_h_l892_c7_238a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l897_c7_7e60] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_cond;
     result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_return_output := result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l889_c7_3ca1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l889_c7_3ca1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;

     -- n16_MUX[uxn_opcodes_h_l889_c7_3ca1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond <= VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond;
     n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue;
     n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output := n16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l889_c7_3ca1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_n16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l897_c7_7e60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l892_c7_238a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l889_c7_3ca1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_cond;
     tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output := tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- n16_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     n16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     n16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_return_output := n16_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l892_c7_238a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_return_output := result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l876_c2_af07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l892_c7_238a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l889_c7_3ca1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output := result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_return_output := tmp16_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l889_c7_3ca1_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l876_c2_af07_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l876_c2_af07] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_cond;
     result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_return_output := result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l920_l872_DUPLICATE_9294 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l920_l872_DUPLICATE_9294_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c2_af07_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l876_c2_af07_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l920_l872_DUPLICATE_9294_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l920_l872_DUPLICATE_9294_return_output;
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
