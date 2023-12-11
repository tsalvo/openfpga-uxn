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
-- BIN_OP_EQ[uxn_opcodes_h_l962_c6_e16e]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l962_c2_08a6]
signal tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l962_c2_08a6]
signal t16_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l962_c2_08a6]
signal n16_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c2_08a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l962_c2_08a6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l962_c2_08a6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c2_08a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c2_08a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l962_c2_08a6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l962_c2_08a6]
signal result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c2_08a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l962_c2_08a6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l975_c11_1edf]
signal BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l975_c7_2d6c]
signal tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l975_c7_2d6c]
signal t16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l975_c7_2d6c]
signal n16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l975_c7_2d6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l975_c7_2d6c]
signal result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l975_c7_2d6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l975_c7_2d6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l975_c7_2d6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l978_c11_9757]
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l978_c7_700c]
signal tmp16_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l978_c7_700c]
signal t16_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l978_c7_700c]
signal n16_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l978_c7_700c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l978_c7_700c]
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l978_c7_700c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c7_700c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l978_c7_700c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l983_c11_f93d]
signal BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l983_c7_fc5d]
signal tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l983_c7_fc5d]
signal t16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l983_c7_fc5d]
signal n16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l983_c7_fc5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l983_c7_fc5d]
signal result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l983_c7_fc5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l983_c7_fc5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l983_c7_fc5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l984_c3_c4b4]
signal BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l987_c11_d728]
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l987_c7_bd68]
signal tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l987_c7_bd68]
signal n16_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_bd68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l987_c7_bd68]
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_bd68]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_bd68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_bd68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l991_c11_c6cb]
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l991_c7_2d37]
signal tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l991_c7_2d37]
signal n16_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_2d37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l991_c7_2d37]
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_2d37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_2d37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_2d37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l992_c3_f6e7]
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l993_c11_b918]
signal BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l994_c30_1bdc]
signal sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l999_c11_0045]
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l999_c7_6702]
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_6702]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_6702]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_6702]
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1002_c31_cd57]
signal CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e
BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l962_c2_08a6
tmp16_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- t16_MUX_uxn_opcodes_h_l962_c2_08a6
t16_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
t16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
t16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
t16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- n16_MUX_uxn_opcodes_h_l962_c2_08a6
n16_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
n16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
n16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
n16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6
result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6
result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6
result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6
result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf
BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_left,
BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_right,
BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c
tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond,
tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue,
tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse,
tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output);

-- t16_MUX_uxn_opcodes_h_l975_c7_2d6c
t16_MUX_uxn_opcodes_h_l975_c7_2d6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond,
t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue,
t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse,
t16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output);

-- n16_MUX_uxn_opcodes_h_l975_c7_2d6c
n16_MUX_uxn_opcodes_h_l975_c7_2d6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond,
n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue,
n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse,
n16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c
result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_cond,
result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757
BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_left,
BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_right,
BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output);

-- tmp16_MUX_uxn_opcodes_h_l978_c7_700c
tmp16_MUX_uxn_opcodes_h_l978_c7_700c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l978_c7_700c_cond,
tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue,
tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse,
tmp16_MUX_uxn_opcodes_h_l978_c7_700c_return_output);

-- t16_MUX_uxn_opcodes_h_l978_c7_700c
t16_MUX_uxn_opcodes_h_l978_c7_700c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l978_c7_700c_cond,
t16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue,
t16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse,
t16_MUX_uxn_opcodes_h_l978_c7_700c_return_output);

-- n16_MUX_uxn_opcodes_h_l978_c7_700c
n16_MUX_uxn_opcodes_h_l978_c7_700c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l978_c7_700c_cond,
n16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue,
n16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse,
n16_MUX_uxn_opcodes_h_l978_c7_700c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c
result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_cond,
result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d
BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_left,
BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_right,
BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d
tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond,
tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue,
tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse,
tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output);

-- t16_MUX_uxn_opcodes_h_l983_c7_fc5d
t16_MUX_uxn_opcodes_h_l983_c7_fc5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond,
t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue,
t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse,
t16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output);

-- n16_MUX_uxn_opcodes_h_l983_c7_fc5d
n16_MUX_uxn_opcodes_h_l983_c7_fc5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond,
n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue,
n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse,
n16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d
result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_cond,
result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4
BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_left,
BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_right,
BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728
BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_left,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_right,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output);

-- tmp16_MUX_uxn_opcodes_h_l987_c7_bd68
tmp16_MUX_uxn_opcodes_h_l987_c7_bd68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_cond,
tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue,
tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse,
tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output);

-- n16_MUX_uxn_opcodes_h_l987_c7_bd68
n16_MUX_uxn_opcodes_h_l987_c7_bd68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l987_c7_bd68_cond,
n16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue,
n16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse,
n16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68
result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_cond,
result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb
BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_left,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_right,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l991_c7_2d37
tmp16_MUX_uxn_opcodes_h_l991_c7_2d37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_cond,
tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue,
tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse,
tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output);

-- n16_MUX_uxn_opcodes_h_l991_c7_2d37
n16_MUX_uxn_opcodes_h_l991_c7_2d37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l991_c7_2d37_cond,
n16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue,
n16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse,
n16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37
result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_cond,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7
BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_left,
BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_right,
BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l993_c11_b918
BIN_OP_AND_uxn_opcodes_h_l993_c11_b918 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_left,
BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_right,
BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_return_output);

-- sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc
sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_ins,
sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_x,
sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_y,
sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045
BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_left,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_right,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702
result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_cond,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57
CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_x,
CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df
CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output,
 tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 t16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 n16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output,
 tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output,
 t16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output,
 n16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output,
 tmp16_MUX_uxn_opcodes_h_l978_c7_700c_return_output,
 t16_MUX_uxn_opcodes_h_l978_c7_700c_return_output,
 n16_MUX_uxn_opcodes_h_l978_c7_700c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output,
 tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output,
 t16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output,
 n16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output,
 tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output,
 n16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output,
 n16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_return_output,
 BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_return_output,
 sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_return_output,
 CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l967_c3_aef7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_7910 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_acb7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_bdc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_23d1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_ccfe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l997_c21_4691_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1000_c3_704e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_d7fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1002_c21_cca8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l978_l962_l983_l975_l987_l999_DUPLICATE_bcd5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_l999_DUPLICATE_9867_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l978_l983_l975_l987_l999_DUPLICATE_b38e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_DUPLICATE_92d3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l988_l984_DUPLICATE_68cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l999_l987_DUPLICATE_c279_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1006_l958_DUPLICATE_a00c_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_7910 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_7910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_acb7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_acb7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l967_c3_aef7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l967_c3_aef7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1000_c3_704e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1000_c3_704e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_ccfe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_ccfe;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_bdc1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_bdc1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_d7fd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_d7fd;
     VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_23d1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_23d1;
     VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse := tmp16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l962_c2_08a6_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c6_e16e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l999_c11_0045] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_left;
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_return_output := BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l987_c11_d728] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_left;
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output := BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1002_c31_cd57] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_return_output := CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l962_c2_08a6_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l994_c30_1bdc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_ins;
     sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_x;
     sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_return_output := sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_l999_DUPLICATE_9867 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_l999_DUPLICATE_9867_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l991_c11_c6cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l999_l987_DUPLICATE_c279 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l999_l987_DUPLICATE_c279_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l975_c11_1edf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_left;
     BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output := BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l988_l984_DUPLICATE_68cc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l988_l984_DUPLICATE_68cc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l962_c2_08a6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l983_c11_f93d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_left;
     BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output := BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l978_c11_9757] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_left;
     BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output := BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l978_l983_l975_l987_l999_DUPLICATE_b38e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l978_l983_l975_l987_l999_DUPLICATE_b38e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l978_l962_l983_l975_l987_l999_DUPLICATE_bcd5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l978_l962_l983_l975_l987_l999_DUPLICATE_bcd5_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_DUPLICATE_92d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_DUPLICATE_92d3_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l962_c2_08a6_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e16e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_1edf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_9757_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_f93d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_d728_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_c6cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_0045_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l988_l984_DUPLICATE_68cc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l988_l984_DUPLICATE_68cc_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l988_l984_DUPLICATE_68cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l978_l983_l975_l987_l999_DUPLICATE_b38e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l978_l983_l975_l987_l999_DUPLICATE_b38e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l978_l983_l975_l987_l999_DUPLICATE_b38e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l978_l983_l975_l987_l999_DUPLICATE_b38e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l978_l983_l975_l987_l999_DUPLICATE_b38e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_l999_DUPLICATE_9867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_l999_DUPLICATE_9867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_l999_DUPLICATE_9867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_l999_DUPLICATE_9867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_l999_DUPLICATE_9867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_l999_DUPLICATE_9867_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_DUPLICATE_92d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_DUPLICATE_92d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_DUPLICATE_92d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_DUPLICATE_92d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l978_l983_l975_l987_l991_DUPLICATE_92d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l999_l987_DUPLICATE_c279_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l999_l987_DUPLICATE_c279_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l978_l962_l983_l975_l987_l999_DUPLICATE_bcd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l978_l962_l983_l975_l987_l999_DUPLICATE_bcd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l978_l962_l983_l975_l987_l999_DUPLICATE_bcd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l978_l962_l983_l975_l987_l999_DUPLICATE_bcd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l978_l962_l983_l975_l987_l999_DUPLICATE_bcd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l978_l962_l983_l975_l987_l999_DUPLICATE_bcd5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l962_c2_08a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l962_c2_08a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l962_c2_08a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l962_c2_08a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_1bdc_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l984_c3_c4b4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_left;
     BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_return_output := BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1002_c21_cca8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1002_c21_cca8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_cd57_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_6702] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_2d37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l992_c3_f6e7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_left;
     BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_return_output := BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_6702] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_6702] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_c4b4_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_right := VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f6e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1002_c21_cca8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l989_l980_DUPLICATE_72df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_6702_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_6702_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_6702_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_bd68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l999_c7_6702] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_cond;
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_return_output := result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_2d37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_2d37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;

     -- t16_MUX[uxn_opcodes_h_l983_c7_fc5d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond <= VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond;
     t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue;
     t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output := t16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_2d37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;

     -- n16_MUX[uxn_opcodes_h_l991_c7_2d37] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l991_c7_2d37_cond <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_cond;
     n16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue;
     n16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output := n16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l993_c11_b918] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_left;
     BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_return_output := BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse := VAR_n16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_6702_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l983_c7_fc5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_bd68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;

     -- t16_MUX[uxn_opcodes_h_l978_c7_700c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l978_c7_700c_cond <= VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_cond;
     t16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue;
     t16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_return_output := t16_MUX_uxn_opcodes_h_l978_c7_700c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_bd68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l991_c7_2d37] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_cond;
     tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue;
     tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output := tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;

     -- n16_MUX[uxn_opcodes_h_l987_c7_bd68] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l987_c7_bd68_cond <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_cond;
     n16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue;
     n16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output := n16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l997_c21_4691] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l997_c21_4691_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_b918_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_bd68] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l997_c21_4691_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l978_c7_700c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l991_c7_2d37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_return_output := result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l983_c7_fc5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l983_c7_fc5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l987_c7_bd68] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_cond;
     tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue;
     tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output := tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;

     -- n16_MUX[uxn_opcodes_h_l983_c7_fc5d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond <= VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond;
     n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue;
     n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output := n16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l983_c7_fc5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;

     -- t16_MUX[uxn_opcodes_h_l975_c7_2d6c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond <= VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond;
     t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue;
     t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output := t16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l978_c7_700c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_700c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_2d37_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;
     -- n16_MUX[uxn_opcodes_h_l978_c7_700c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l978_c7_700c_cond <= VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_cond;
     n16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue;
     n16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_return_output := n16_MUX_uxn_opcodes_h_l978_c7_700c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c7_700c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l987_c7_bd68] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_cond;
     result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_return_output := result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l983_c7_fc5d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_cond;
     tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output := tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l978_c7_700c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_return_output;

     -- t16_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     t16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     t16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := t16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l978_c7_700c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l975_c7_2d6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l978_c7_700c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_700c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_700c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_700c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_bd68_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l975_c7_2d6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l978_c7_700c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l978_c7_700c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_cond;
     tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_return_output := tmp16_MUX_uxn_opcodes_h_l978_c7_700c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l975_c7_2d6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l983_c7_fc5d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output := result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;

     -- n16_MUX[uxn_opcodes_h_l975_c7_2d6c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond <= VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond;
     n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue;
     n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output := n16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l975_c7_2d6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_fc5d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_700c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l975_c7_2d6c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_cond;
     tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output := tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;

     -- n16_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     n16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     n16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := n16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l978_c7_700c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_return_output := result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_700c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l975_c7_2d6c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output := result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_2d6c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l962_c2_08a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1006_l958_DUPLICATE_a00c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1006_l958_DUPLICATE_a00c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_08a6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_08a6_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1006_l958_DUPLICATE_a00c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1006_l958_DUPLICATE_a00c_return_output;
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
