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
-- BIN_OP_EQ[uxn_opcodes_h_l962_c6_a002]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal t16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l962_c2_cdd3]
signal n16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l975_c11_9f5c]
signal BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l975_c7_bee8]
signal tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l975_c7_bee8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l975_c7_bee8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l975_c7_bee8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l975_c7_bee8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l975_c7_bee8]
signal result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l975_c7_bee8]
signal t16_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l975_c7_bee8]
signal n16_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l978_c11_ff73]
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l978_c7_9e7a]
signal tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c7_9e7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l978_c7_9e7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l978_c7_9e7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l978_c7_9e7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l978_c7_9e7a]
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l978_c7_9e7a]
signal t16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l978_c7_9e7a]
signal n16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l983_c11_0cb9]
signal BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l983_c7_1b0a]
signal tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l983_c7_1b0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l983_c7_1b0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l983_c7_1b0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l983_c7_1b0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l983_c7_1b0a]
signal result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l983_c7_1b0a]
signal t16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l983_c7_1b0a]
signal n16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l984_c3_2ec0]
signal BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l987_c11_1ca6]
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l987_c7_0e31]
signal tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_0e31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_0e31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_0e31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_0e31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l987_c7_0e31]
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l987_c7_0e31]
signal n16_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l991_c11_0665]
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l991_c7_3401]
signal tmp16_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_3401]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_3401]
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_3401]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_3401]
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l991_c7_3401]
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l991_c7_3401]
signal n16_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l992_c3_408f]
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l993_c11_7920]
signal BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l994_c30_8f77]
signal sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l999_c11_5f0d]
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_34a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_34a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l999_c7_34a2]
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_34a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1002_c31_0132]
signal CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002
BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output);

-- tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3
tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3
result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3
result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3
result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3
result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- t16_MUX_uxn_opcodes_h_l962_c2_cdd3
t16_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
t16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- n16_MUX_uxn_opcodes_h_l962_c2_cdd3
n16_MUX_uxn_opcodes_h_l962_c2_cdd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond,
n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue,
n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse,
n16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c
BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_left,
BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_right,
BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l975_c7_bee8
tmp16_MUX_uxn_opcodes_h_l975_c7_bee8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_cond,
tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue,
tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse,
tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8
result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8
result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_cond,
result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_return_output);

-- t16_MUX_uxn_opcodes_h_l975_c7_bee8
t16_MUX_uxn_opcodes_h_l975_c7_bee8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l975_c7_bee8_cond,
t16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue,
t16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse,
t16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output);

-- n16_MUX_uxn_opcodes_h_l975_c7_bee8
n16_MUX_uxn_opcodes_h_l975_c7_bee8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l975_c7_bee8_cond,
n16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue,
n16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse,
n16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73
BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_left,
BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_right,
BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output);

-- tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a
tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond,
tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue,
tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse,
tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a
result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output);

-- t16_MUX_uxn_opcodes_h_l978_c7_9e7a
t16_MUX_uxn_opcodes_h_l978_c7_9e7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond,
t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue,
t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse,
t16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output);

-- n16_MUX_uxn_opcodes_h_l978_c7_9e7a
n16_MUX_uxn_opcodes_h_l978_c7_9e7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond,
n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue,
n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse,
n16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9
BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_left,
BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_right,
BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a
tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond,
tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue,
tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse,
tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a
result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_cond,
result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output);

-- t16_MUX_uxn_opcodes_h_l983_c7_1b0a
t16_MUX_uxn_opcodes_h_l983_c7_1b0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond,
t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue,
t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse,
t16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output);

-- n16_MUX_uxn_opcodes_h_l983_c7_1b0a
n16_MUX_uxn_opcodes_h_l983_c7_1b0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond,
n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue,
n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse,
n16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0
BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_left,
BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_right,
BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6
BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_left,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_right,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l987_c7_0e31
tmp16_MUX_uxn_opcodes_h_l987_c7_0e31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_cond,
tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue,
tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse,
tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31
result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_cond,
result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_return_output);

-- n16_MUX_uxn_opcodes_h_l987_c7_0e31
n16_MUX_uxn_opcodes_h_l987_c7_0e31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l987_c7_0e31_cond,
n16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue,
n16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse,
n16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665
BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_left,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_right,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output);

-- tmp16_MUX_uxn_opcodes_h_l991_c7_3401
tmp16_MUX_uxn_opcodes_h_l991_c7_3401 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l991_c7_3401_cond,
tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue,
tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse,
tmp16_MUX_uxn_opcodes_h_l991_c7_3401_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401
result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_cond,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_return_output);

-- n16_MUX_uxn_opcodes_h_l991_c7_3401
n16_MUX_uxn_opcodes_h_l991_c7_3401 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l991_c7_3401_cond,
n16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue,
n16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse,
n16_MUX_uxn_opcodes_h_l991_c7_3401_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l992_c3_408f
BIN_OP_OR_uxn_opcodes_h_l992_c3_408f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_left,
BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_right,
BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l993_c11_7920
BIN_OP_AND_uxn_opcodes_h_l993_c11_7920 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_left,
BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_right,
BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_return_output);

-- sp_relative_shift_uxn_opcodes_h_l994_c30_8f77
sp_relative_shift_uxn_opcodes_h_l994_c30_8f77 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_ins,
sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_x,
sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_y,
sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d
BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_left,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_right,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2
result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1002_c31_0132
CONST_SR_8_uxn_opcodes_h_l1002_c31_0132 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_x,
CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f
CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output,
 tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 t16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 n16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output,
 tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_return_output,
 t16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output,
 n16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output,
 tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output,
 t16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output,
 n16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output,
 tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output,
 t16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output,
 n16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output,
 tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_return_output,
 n16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output,
 tmp16_MUX_uxn_opcodes_h_l991_c7_3401_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_return_output,
 n16_MUX_uxn_opcodes_h_l991_c7_3401_return_output,
 BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_return_output,
 sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_return_output,
 CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l967_c3_baee : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_254f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_dbc3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_8299 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_1a11 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_fed2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l997_c21_3968_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_b983 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1000_c3_9e4a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1002_c21_2ba6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l962_l975_l999_l983_l987_l978_DUPLICATE_d444_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l991_l975_l983_l987_l978_DUPLICATE_452f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l975_l999_l983_l987_l978_DUPLICATE_be75_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l991_l975_l999_l983_l987_l978_DUPLICATE_b2ab_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l984_l988_DUPLICATE_ee40_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l999_l987_DUPLICATE_57b3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l958_l1006_DUPLICATE_814f_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l967_c3_baee := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l967_c3_baee;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_254f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_254f;
     VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_1a11 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_1a11;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_8299 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_8299;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_fed2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_fed2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_b983 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_b983;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1000_c3_9e4a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1000_c3_9e4a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_dbc3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_dbc3;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse := tmp16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l999_l987_DUPLICATE_57b3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l999_l987_DUPLICATE_57b3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l962_l975_l999_l983_l987_l978_DUPLICATE_d444 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l962_l975_l999_l983_l987_l978_DUPLICATE_d444_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l987_c11_1ca6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_left;
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output := BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l975_l999_l983_l987_l978_DUPLICATE_be75 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l975_l999_l983_l987_l978_DUPLICATE_be75_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l983_c11_0cb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l1002_c31_0132] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_return_output := CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l994_c30_8f77] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_ins;
     sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_x <= VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_x;
     sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_y <= VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_return_output := sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c6_a002] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l991_l975_l983_l987_l978_DUPLICATE_452f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l991_l975_l983_l987_l978_DUPLICATE_452f_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l991_l975_l999_l983_l987_l978_DUPLICATE_b2ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l991_l975_l999_l983_l987_l978_DUPLICATE_b2ab_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l991_c11_0665] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_left;
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output := BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l978_c11_ff73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_left;
     BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output := BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l984_l988_DUPLICATE_ee40 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l984_l988_DUPLICATE_ee40_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l999_c11_5f0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l975_c11_9f5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_a002_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_9f5c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_ff73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_0cb9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_1ca6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_0665_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_5f0d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l984_l988_DUPLICATE_ee40_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l984_l988_DUPLICATE_ee40_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l979_l992_l984_l988_DUPLICATE_ee40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l975_l999_l983_l987_l978_DUPLICATE_be75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l975_l999_l983_l987_l978_DUPLICATE_be75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l975_l999_l983_l987_l978_DUPLICATE_be75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l975_l999_l983_l987_l978_DUPLICATE_be75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l975_l999_l983_l987_l978_DUPLICATE_be75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l991_l975_l999_l983_l987_l978_DUPLICATE_b2ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l991_l975_l999_l983_l987_l978_DUPLICATE_b2ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l991_l975_l999_l983_l987_l978_DUPLICATE_b2ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l991_l975_l999_l983_l987_l978_DUPLICATE_b2ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l991_l975_l999_l983_l987_l978_DUPLICATE_b2ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l991_l975_l999_l983_l987_l978_DUPLICATE_b2ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l991_l975_l983_l987_l978_DUPLICATE_452f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l991_l975_l983_l987_l978_DUPLICATE_452f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l991_l975_l983_l987_l978_DUPLICATE_452f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l991_l975_l983_l987_l978_DUPLICATE_452f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l991_l975_l983_l987_l978_DUPLICATE_452f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l999_l987_DUPLICATE_57b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l999_l987_DUPLICATE_57b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l962_l975_l999_l983_l987_l978_DUPLICATE_d444_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l962_l975_l999_l983_l987_l978_DUPLICATE_d444_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l962_l975_l999_l983_l987_l978_DUPLICATE_d444_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l962_l975_l999_l983_l987_l978_DUPLICATE_d444_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l962_l975_l999_l983_l987_l978_DUPLICATE_d444_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l962_l975_l999_l983_l987_l978_DUPLICATE_d444_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l962_c2_cdd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l994_c30_8f77_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1002_c21_2ba6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1002_c21_2ba6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1002_c31_0132_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_34a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_34a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l992_c3_408f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_left;
     BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_return_output := BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_34a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l984_c3_2ec0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_left;
     BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_return_output := BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_3401] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l984_c3_2ec0_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_right := VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_408f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1002_c21_2ba6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l980_l989_DUPLICATE_a21f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_34a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_3401_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_34a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_34a2_return_output;
     -- n16_MUX[uxn_opcodes_h_l991_c7_3401] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l991_c7_3401_cond <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_cond;
     n16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue;
     n16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_return_output := n16_MUX_uxn_opcodes_h_l991_c7_3401_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_3401] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l999_c7_34a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l993_c11_7920] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_left;
     BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_return_output := BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_3401] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_0e31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;

     -- t16_MUX[uxn_opcodes_h_l983_c7_1b0a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond <= VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond;
     t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue;
     t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output := t16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_3401] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse := VAR_n16_MUX_uxn_opcodes_h_l991_c7_3401_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_3401_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_3401_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_3401_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_34a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l991_c7_3401] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l991_c7_3401_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_cond;
     tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iftrue;
     tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_return_output := tmp16_MUX_uxn_opcodes_h_l991_c7_3401_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_0e31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;

     -- n16_MUX[uxn_opcodes_h_l987_c7_0e31] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l987_c7_0e31_cond <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_cond;
     n16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue;
     n16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output := n16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_0e31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_0e31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l983_c7_1b0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l997_c21_3968] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l997_c21_3968_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l993_c11_7920_return_output);

     -- t16_MUX[uxn_opcodes_h_l978_c7_9e7a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond <= VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond;
     t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue;
     t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output := t16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l997_c21_3968_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_3401_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l978_c7_9e7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l987_c7_0e31] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_cond;
     tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue;
     tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output := tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l983_c7_1b0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l991_c7_3401] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_cond;
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_return_output := result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l983_c7_1b0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;

     -- t16_MUX[uxn_opcodes_h_l975_c7_bee8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l975_c7_bee8_cond <= VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_cond;
     t16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue;
     t16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output := t16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l983_c7_1b0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;

     -- n16_MUX[uxn_opcodes_h_l983_c7_1b0a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond <= VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond;
     n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue;
     n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output := n16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_3401_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l978_c7_9e7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c7_9e7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l975_c7_bee8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;

     -- n16_MUX[uxn_opcodes_h_l978_c7_9e7a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond <= VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond;
     n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue;
     n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output := n16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l987_c7_0e31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_return_output := result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l978_c7_9e7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l983_c7_1b0a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_cond;
     tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output := tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;

     -- t16_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := t16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_0e31_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l978_c7_9e7a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_cond;
     tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output := tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l975_c7_bee8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l983_c7_1b0a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output := result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l975_c7_bee8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;

     -- n16_MUX[uxn_opcodes_h_l975_c7_bee8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l975_c7_bee8_cond <= VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_cond;
     n16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue;
     n16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output := n16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l975_c7_bee8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c7_1b0a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- n16_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := n16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l975_c7_bee8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_cond;
     tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output := tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l978_c7_9e7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9e7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l975_c7_bee8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_return_output := result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l975_c7_bee8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l962_c2_cdd3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output := result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l958_l1006_DUPLICATE_814f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l958_l1006_DUPLICATE_814f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_cdd3_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l958_l1006_DUPLICATE_814f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l958_l1006_DUPLICATE_814f_return_output;
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
