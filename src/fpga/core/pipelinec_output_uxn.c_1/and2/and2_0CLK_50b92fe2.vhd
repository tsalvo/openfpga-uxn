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
entity and2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_50b92fe2;
architecture arch of and2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l956_c6_8c57]
signal BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal n16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l956_c2_bf0c]
signal t16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l969_c11_df07]
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l969_c7_b6e5]
signal n16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l969_c7_b6e5]
signal tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_b6e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_b6e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l969_c7_b6e5]
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_b6e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_b6e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l969_c7_b6e5]
signal t16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l972_c11_803c]
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l972_c7_59ef]
signal n16_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l972_c7_59ef]
signal tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_59ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l972_c7_59ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l972_c7_59ef]
signal result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_59ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_59ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l972_c7_59ef]
signal t16_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_79ba]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l977_c7_fe43]
signal n16_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l977_c7_fe43]
signal tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_fe43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_fe43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l977_c7_fe43]
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_fe43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_fe43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l977_c7_fe43]
signal t16_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l978_c3_4d33]
signal BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l981_c11_88cf]
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l981_c7_08bd]
signal n16_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l981_c7_08bd]
signal tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_08bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_08bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l981_c7_08bd]
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_08bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_08bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l985_c11_c1a0]
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l985_c7_b55d]
signal n16_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l985_c7_b55d]
signal tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l985_c7_b55d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l985_c7_b55d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l985_c7_b55d]
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l985_c7_b55d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l985_c7_b55d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l986_c3_714a]
signal BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l987_c11_cb31]
signal BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l988_c30_7990]
signal sp_relative_shift_uxn_opcodes_h_l988_c30_7990_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l988_c30_7990_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l988_c30_7990_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l988_c30_7990_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l993_c11_d8ef]
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l993_c7_42c0]
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_42c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_42c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_42c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l996_c31_f673]
signal CONST_SR_8_uxn_opcodes_h_l996_c31_f673_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l996_c31_f673_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57
BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_left,
BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_right,
BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output);

-- n16_MUX_uxn_opcodes_h_l956_c2_bf0c
n16_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
n16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c
tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c
result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c
result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c
result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c
result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c
result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c
result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- t16_MUX_uxn_opcodes_h_l956_c2_bf0c
t16_MUX_uxn_opcodes_h_l956_c2_bf0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond,
t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue,
t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse,
t16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07
BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_left,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_right,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output);

-- n16_MUX_uxn_opcodes_h_l969_c7_b6e5
n16_MUX_uxn_opcodes_h_l969_c7_b6e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond,
n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue,
n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse,
n16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5
tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond,
tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5
result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output);

-- t16_MUX_uxn_opcodes_h_l969_c7_b6e5
t16_MUX_uxn_opcodes_h_l969_c7_b6e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond,
t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue,
t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse,
t16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c
BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_left,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_right,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output);

-- n16_MUX_uxn_opcodes_h_l972_c7_59ef
n16_MUX_uxn_opcodes_h_l972_c7_59ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l972_c7_59ef_cond,
n16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue,
n16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse,
n16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output);

-- tmp16_MUX_uxn_opcodes_h_l972_c7_59ef
tmp16_MUX_uxn_opcodes_h_l972_c7_59ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_cond,
tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue,
tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse,
tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef
result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_return_output);

-- t16_MUX_uxn_opcodes_h_l972_c7_59ef
t16_MUX_uxn_opcodes_h_l972_c7_59ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l972_c7_59ef_cond,
t16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue,
t16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse,
t16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba
BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output);

-- n16_MUX_uxn_opcodes_h_l977_c7_fe43
n16_MUX_uxn_opcodes_h_l977_c7_fe43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l977_c7_fe43_cond,
n16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue,
n16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse,
n16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output);

-- tmp16_MUX_uxn_opcodes_h_l977_c7_fe43
tmp16_MUX_uxn_opcodes_h_l977_c7_fe43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_cond,
tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue,
tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse,
tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43
result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_cond,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_return_output);

-- t16_MUX_uxn_opcodes_h_l977_c7_fe43
t16_MUX_uxn_opcodes_h_l977_c7_fe43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l977_c7_fe43_cond,
t16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue,
t16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse,
t16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33
BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_left,
BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_right,
BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf
BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_left,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_right,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output);

-- n16_MUX_uxn_opcodes_h_l981_c7_08bd
n16_MUX_uxn_opcodes_h_l981_c7_08bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l981_c7_08bd_cond,
n16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue,
n16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse,
n16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l981_c7_08bd
tmp16_MUX_uxn_opcodes_h_l981_c7_08bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_cond,
tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd
result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0
BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_left,
BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_right,
BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output);

-- n16_MUX_uxn_opcodes_h_l985_c7_b55d
n16_MUX_uxn_opcodes_h_l985_c7_b55d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l985_c7_b55d_cond,
n16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue,
n16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse,
n16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l985_c7_b55d
tmp16_MUX_uxn_opcodes_h_l985_c7_b55d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_cond,
tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue,
tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse,
tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d
result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_cond,
result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l986_c3_714a
BIN_OP_OR_uxn_opcodes_h_l986_c3_714a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_left,
BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_right,
BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31
BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_left,
BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_right,
BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_return_output);

-- sp_relative_shift_uxn_opcodes_h_l988_c30_7990
sp_relative_shift_uxn_opcodes_h_l988_c30_7990 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l988_c30_7990_ins,
sp_relative_shift_uxn_opcodes_h_l988_c30_7990_x,
sp_relative_shift_uxn_opcodes_h_l988_c30_7990_y,
sp_relative_shift_uxn_opcodes_h_l988_c30_7990_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef
BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_left,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_right,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0
result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_cond,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l996_c31_f673
CONST_SR_8_uxn_opcodes_h_l996_c31_f673 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l996_c31_f673_x,
CONST_SR_8_uxn_opcodes_h_l996_c31_f673_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output,
 n16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 t16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output,
 n16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output,
 t16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output,
 n16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output,
 tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_return_output,
 t16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output,
 n16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output,
 tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_return_output,
 t16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output,
 BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output,
 n16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output,
 n16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output,
 tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_return_output,
 sp_relative_shift_uxn_opcodes_h_l988_c30_7990_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_return_output,
 CONST_SR_8_uxn_opcodes_h_l996_c31_f673_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l961_c3_7c92 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_3deb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_10fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_c850 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_4dad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_f6d6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l991_c21_3ce3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l994_c3_6b4d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_c595 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_f673_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_f673_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l996_c21_b73b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l956_l981_l969_l972_l993_DUPLICATE_f200_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_l993_DUPLICATE_0a87_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l981_l969_l972_l993_DUPLICATE_b92f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_DUPLICATE_bf24_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l973_l982_l978_l986_DUPLICATE_ea1d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l981_l993_DUPLICATE_cc70_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l952_l1000_DUPLICATE_6d56_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l961_c3_7c92 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l961_c3_7c92;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_f6d6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_f6d6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_3deb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_3deb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l994_c3_6b4d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l994_c3_6b4d;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_c850 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_c850;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_4dad := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_4dad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_10fd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_10fd;
     VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_c595 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_c595;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_f673_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_l993_DUPLICATE_0a87 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_l993_DUPLICATE_0a87_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l985_c11_c1a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l988_c30_7990] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l988_c30_7990_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_ins;
     sp_relative_shift_uxn_opcodes_h_l988_c30_7990_x <= VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_x;
     sp_relative_shift_uxn_opcodes_h_l988_c30_7990_y <= VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_return_output := sp_relative_shift_uxn_opcodes_h_l988_c30_7990_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l981_l969_l972_l993_DUPLICATE_b92f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l981_l969_l972_l993_DUPLICATE_b92f_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l981_c11_88cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l956_l981_l969_l972_l993_DUPLICATE_f200 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l956_l981_l969_l972_l993_DUPLICATE_f200_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_79ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l969_c11_df07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_left;
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output := BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l972_c11_803c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_left;
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output := BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l993_c11_d8ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l973_l982_l978_l986_DUPLICATE_ea1d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l973_l982_l978_l986_DUPLICATE_ea1d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_DUPLICATE_bf24 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_DUPLICATE_bf24_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l956_c6_8c57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_left;
     BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output := BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l981_l993_DUPLICATE_cc70 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l981_l993_DUPLICATE_cc70_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l996_c31_f673] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l996_c31_f673_x <= VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_f673_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_f673_return_output := CONST_SR_8_uxn_opcodes_h_l996_c31_f673_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_8c57_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_df07_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_803c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_79ba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_88cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c1a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_d8ef_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l973_l982_l978_l986_DUPLICATE_ea1d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l973_l982_l978_l986_DUPLICATE_ea1d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l973_l982_l978_l986_DUPLICATE_ea1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l981_l969_l972_l993_DUPLICATE_b92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l981_l969_l972_l993_DUPLICATE_b92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l981_l969_l972_l993_DUPLICATE_b92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l981_l969_l972_l993_DUPLICATE_b92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l981_l969_l972_l993_DUPLICATE_b92f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_l993_DUPLICATE_0a87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_l993_DUPLICATE_0a87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_l993_DUPLICATE_0a87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_l993_DUPLICATE_0a87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_l993_DUPLICATE_0a87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_l993_DUPLICATE_0a87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_DUPLICATE_bf24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_DUPLICATE_bf24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_DUPLICATE_bf24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_DUPLICATE_bf24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l977_l981_l969_l985_l972_DUPLICATE_bf24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l981_l993_DUPLICATE_cc70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l981_l993_DUPLICATE_cc70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l956_l981_l969_l972_l993_DUPLICATE_f200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l956_l981_l969_l972_l993_DUPLICATE_f200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l956_l981_l969_l972_l993_DUPLICATE_f200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l956_l981_l969_l972_l993_DUPLICATE_f200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l956_l981_l969_l972_l993_DUPLICATE_f200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l956_l981_l969_l972_l993_DUPLICATE_f200_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l956_c2_bf0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_7990_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l986_c3_714a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_left;
     BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_return_output := BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l985_c7_b55d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_42c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l996_c21_b73b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l996_c21_b73b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_f673_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_42c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_42c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l978_c3_4d33] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_left;
     BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_return_output := BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_4d33_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_right := VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_714a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l996_c21_b73b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_ed63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_42c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_42c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_42c0_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l987_c11_cb31] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_left;
     BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_return_output := BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_return_output;

     -- n16_MUX[uxn_opcodes_h_l985_c7_b55d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l985_c7_b55d_cond <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_cond;
     n16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue;
     n16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output := n16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l985_c7_b55d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_08bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l985_c7_b55d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;

     -- t16_MUX[uxn_opcodes_h_l977_c7_fe43] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l977_c7_fe43_cond <= VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_cond;
     t16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue;
     t16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output := t16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l985_c7_b55d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l993_c7_42c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_return_output := result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_42c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l991_c21_3ce3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l991_c21_3ce3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_cb31_return_output);

     -- t16_MUX[uxn_opcodes_h_l972_c7_59ef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l972_c7_59ef_cond <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_cond;
     t16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue;
     t16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output := t16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_08bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_08bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_fe43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;

     -- n16_MUX[uxn_opcodes_h_l981_c7_08bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l981_c7_08bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_cond;
     n16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue;
     n16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output := n16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_08bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l985_c7_b55d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_cond;
     tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output := tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l991_c21_3ce3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse := VAR_n16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_59ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l981_c7_08bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_cond;
     tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output := tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l985_c7_b55d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_return_output := result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_fe43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_fe43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;

     -- t16_MUX[uxn_opcodes_h_l969_c7_b6e5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond <= VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond;
     t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue;
     t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output := t16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l977_c7_fe43] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l977_c7_fe43_cond <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_cond;
     n16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue;
     n16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output := n16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_fe43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_b55d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l972_c7_59ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_b6e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_59ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;

     -- t16_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := t16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_59ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;

     -- n16_MUX[uxn_opcodes_h_l972_c7_59ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l972_c7_59ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_cond;
     n16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue;
     n16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output := n16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l977_c7_fe43] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_cond;
     tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue;
     tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output := tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l981_c7_08bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_08bd_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_b6e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_b6e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_b6e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l977_c7_fe43] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_cond;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_return_output := result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l972_c7_59ef] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_cond;
     tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue;
     tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output := tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;

     -- n16_MUX[uxn_opcodes_h_l969_c7_b6e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond;
     n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue;
     n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output := n16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_fe43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;
     -- n16_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := n16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l969_c7_b6e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_cond;
     tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output := tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l972_c7_59ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_59ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l969_c7_b6e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_b6e5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l956_c2_bf0c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output := result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l952_l1000_DUPLICATE_6d56 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l952_l1000_DUPLICATE_6d56_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_bf0c_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l952_l1000_DUPLICATE_6d56_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l952_l1000_DUPLICATE_6d56_return_output;
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
