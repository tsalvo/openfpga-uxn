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
-- BIN_OP_EQ[uxn_opcodes_h_l957_c6_20b4]
signal BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal n16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l957_c2_b0f6]
signal t16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l970_c11_37ea]
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l970_c7_a2ae]
signal n16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l970_c7_a2ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l970_c7_a2ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l970_c7_a2ae]
signal result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l970_c7_a2ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l970_c7_a2ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l970_c7_a2ae]
signal tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l970_c7_a2ae]
signal t16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l973_c11_bf01]
signal BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l973_c7_6877]
signal n16_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l973_c7_6877]
signal result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l973_c7_6877]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l973_c7_6877]
signal result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l973_c7_6877]
signal result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l973_c7_6877]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l973_c7_6877]
signal tmp16_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l973_c7_6877]
signal t16_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l978_c11_558f]
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l978_c7_9895]
signal n16_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l978_c7_9895]
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c7_9895]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l978_c7_9895]
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l978_c7_9895]
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l978_c7_9895]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l978_c7_9895]
signal tmp16_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l978_c7_9895]
signal t16_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l979_c3_0327]
signal BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l982_c11_cab4]
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l982_c7_2ae2]
signal n16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l982_c7_2ae2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l982_c7_2ae2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l982_c7_2ae2]
signal result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l982_c7_2ae2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l982_c7_2ae2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l982_c7_2ae2]
signal tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l986_c11_1dec]
signal BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l986_c7_61b7]
signal n16_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l986_c7_61b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l986_c7_61b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l986_c7_61b7]
signal result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l986_c7_61b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l986_c7_61b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l986_c7_61b7]
signal tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l987_c3_b974]
signal BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l988_c11_4132]
signal BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l989_c30_5b6b]
signal sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l994_c11_4998]
signal BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l994_c7_e923]
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l994_c7_e923]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l994_c7_e923]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l994_c7_e923]
signal result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l997_c31_d978]
signal CONST_SR_8_uxn_opcodes_h_l997_c31_d978_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l997_c31_d978_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4
BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_left,
BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_right,
BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output);

-- n16_MUX_uxn_opcodes_h_l957_c2_b0f6
n16_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
n16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6
result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6
result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6
result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6
result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6
result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6
result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6
tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- t16_MUX_uxn_opcodes_h_l957_c2_b0f6
t16_MUX_uxn_opcodes_h_l957_c2_b0f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond,
t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue,
t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse,
t16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea
BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_left,
BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_right,
BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output);

-- n16_MUX_uxn_opcodes_h_l970_c7_a2ae
n16_MUX_uxn_opcodes_h_l970_c7_a2ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond,
n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue,
n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse,
n16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae
result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae
tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond,
tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output);

-- t16_MUX_uxn_opcodes_h_l970_c7_a2ae
t16_MUX_uxn_opcodes_h_l970_c7_a2ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond,
t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue,
t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse,
t16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01
BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_left,
BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_right,
BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output);

-- n16_MUX_uxn_opcodes_h_l973_c7_6877
n16_MUX_uxn_opcodes_h_l973_c7_6877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l973_c7_6877_cond,
n16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue,
n16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse,
n16_MUX_uxn_opcodes_h_l973_c7_6877_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877
result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877
result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_cond,
result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877
result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877
result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_return_output);

-- tmp16_MUX_uxn_opcodes_h_l973_c7_6877
tmp16_MUX_uxn_opcodes_h_l973_c7_6877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l973_c7_6877_cond,
tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue,
tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse,
tmp16_MUX_uxn_opcodes_h_l973_c7_6877_return_output);

-- t16_MUX_uxn_opcodes_h_l973_c7_6877
t16_MUX_uxn_opcodes_h_l973_c7_6877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l973_c7_6877_cond,
t16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue,
t16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse,
t16_MUX_uxn_opcodes_h_l973_c7_6877_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f
BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_left,
BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_right,
BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output);

-- n16_MUX_uxn_opcodes_h_l978_c7_9895
n16_MUX_uxn_opcodes_h_l978_c7_9895 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l978_c7_9895_cond,
n16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue,
n16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse,
n16_MUX_uxn_opcodes_h_l978_c7_9895_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895
result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_cond,
result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_return_output);

-- tmp16_MUX_uxn_opcodes_h_l978_c7_9895
tmp16_MUX_uxn_opcodes_h_l978_c7_9895 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l978_c7_9895_cond,
tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue,
tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse,
tmp16_MUX_uxn_opcodes_h_l978_c7_9895_return_output);

-- t16_MUX_uxn_opcodes_h_l978_c7_9895
t16_MUX_uxn_opcodes_h_l978_c7_9895 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l978_c7_9895_cond,
t16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue,
t16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse,
t16_MUX_uxn_opcodes_h_l978_c7_9895_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l979_c3_0327
BIN_OP_OR_uxn_opcodes_h_l979_c3_0327 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_left,
BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_right,
BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4
BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_left,
BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_right,
BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output);

-- n16_MUX_uxn_opcodes_h_l982_c7_2ae2
n16_MUX_uxn_opcodes_h_l982_c7_2ae2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond,
n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue,
n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse,
n16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2
result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_cond,
result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2
result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2
tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond,
tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue,
tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse,
tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec
BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_left,
BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_right,
BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output);

-- n16_MUX_uxn_opcodes_h_l986_c7_61b7
n16_MUX_uxn_opcodes_h_l986_c7_61b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l986_c7_61b7_cond,
n16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue,
n16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse,
n16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7
result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7
result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7
result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l986_c7_61b7
tmp16_MUX_uxn_opcodes_h_l986_c7_61b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_cond,
tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l987_c3_b974
BIN_OP_OR_uxn_opcodes_h_l987_c3_b974 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_left,
BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_right,
BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l988_c11_4132
BIN_OP_AND_uxn_opcodes_h_l988_c11_4132 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_left,
BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_right,
BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_return_output);

-- sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b
sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_ins,
sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_x,
sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_y,
sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998
BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_left,
BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_right,
BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923
result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_cond,
result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_return_output);

-- CONST_SR_8_uxn_opcodes_h_l997_c31_d978
CONST_SR_8_uxn_opcodes_h_l997_c31_d978 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l997_c31_d978_x,
CONST_SR_8_uxn_opcodes_h_l997_c31_d978_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31
CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output,
 n16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 t16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output,
 n16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output,
 t16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output,
 n16_MUX_uxn_opcodes_h_l973_c7_6877_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_return_output,
 tmp16_MUX_uxn_opcodes_h_l973_c7_6877_return_output,
 t16_MUX_uxn_opcodes_h_l973_c7_6877_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output,
 n16_MUX_uxn_opcodes_h_l978_c7_9895_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_return_output,
 tmp16_MUX_uxn_opcodes_h_l978_c7_9895_return_output,
 t16_MUX_uxn_opcodes_h_l978_c7_9895_return_output,
 BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output,
 n16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output,
 tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output,
 n16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_return_output,
 tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_return_output,
 BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_return_output,
 sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_return_output,
 CONST_SR_8_uxn_opcodes_h_l997_c31_d978_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l967_c3_7315 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l962_c3_d6b6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l971_c3_ff25 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_be62 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l980_c3_d879 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l991_c3_c2cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l992_c21_c40c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_5c4f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l995_c3_124f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l997_c31_d978_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l997_c31_d978_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l997_c21_0a38_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l970_l973_l982_l957_l994_l978_DUPLICATE_eb0e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l970_l986_l973_l982_l994_l978_DUPLICATE_6650_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l970_l986_l973_l982_l978_DUPLICATE_189a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l970_l973_l982_l994_l978_DUPLICATE_ba01_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l974_l987_l979_l983_DUPLICATE_1bfc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l994_l982_DUPLICATE_97c8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1001_l953_DUPLICATE_2961_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l962_c3_d6b6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l962_c3_d6b6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_be62 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_be62;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l980_c3_d879 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l980_c3_d879;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l971_c3_ff25 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l971_c3_ff25;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_5c4f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_5c4f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l967_c3_7315 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l967_c3_7315;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l995_c3_124f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l995_c3_124f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l991_c3_c2cf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l991_c3_c2cf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l997_c31_d978_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l986_c11_1dec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_left;
     BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output := BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l994_c11_4998] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_left;
     BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_return_output := BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l974_l987_l979_l983_DUPLICATE_1bfc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l974_l987_l979_l983_DUPLICATE_1bfc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l978_c11_558f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_left;
     BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output := BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l970_l986_l973_l982_l978_DUPLICATE_189a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l970_l986_l973_l982_l978_DUPLICATE_189a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l982_c11_cab4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_left;
     BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output := BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l973_c11_bf01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_left;
     BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output := BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l970_l986_l973_l982_l994_l978_DUPLICATE_6650 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l970_l986_l973_l982_l994_l978_DUPLICATE_6650_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l957_c6_20b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l970_c11_37ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output := result.is_vram_write;

     -- CONST_SR_8[uxn_opcodes_h_l997_c31_d978] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l997_c31_d978_x <= VAR_CONST_SR_8_uxn_opcodes_h_l997_c31_d978_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l997_c31_d978_return_output := CONST_SR_8_uxn_opcodes_h_l997_c31_d978_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l970_l973_l982_l994_l978_DUPLICATE_ba01 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l970_l973_l982_l994_l978_DUPLICATE_ba01_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l970_l973_l982_l957_l994_l978_DUPLICATE_eb0e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l970_l973_l982_l957_l994_l978_DUPLICATE_eb0e_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l994_l982_DUPLICATE_97c8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l994_l982_DUPLICATE_97c8_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l989_c30_5b6b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_ins;
     sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_x;
     sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_return_output := sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c6_20b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_37ea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l973_c11_bf01_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l978_c11_558f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_cab4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c11_1dec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_4998_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l974_l987_l979_l983_DUPLICATE_1bfc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l974_l987_l979_l983_DUPLICATE_1bfc_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l974_l987_l979_l983_DUPLICATE_1bfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l970_l973_l982_l994_l978_DUPLICATE_ba01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l970_l973_l982_l994_l978_DUPLICATE_ba01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l970_l973_l982_l994_l978_DUPLICATE_ba01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l970_l973_l982_l994_l978_DUPLICATE_ba01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l970_l973_l982_l994_l978_DUPLICATE_ba01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l970_l986_l973_l982_l994_l978_DUPLICATE_6650_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l970_l986_l973_l982_l994_l978_DUPLICATE_6650_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l970_l986_l973_l982_l994_l978_DUPLICATE_6650_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l970_l986_l973_l982_l994_l978_DUPLICATE_6650_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l970_l986_l973_l982_l994_l978_DUPLICATE_6650_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l970_l986_l973_l982_l994_l978_DUPLICATE_6650_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l970_l986_l973_l982_l978_DUPLICATE_189a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l970_l986_l973_l982_l978_DUPLICATE_189a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l970_l986_l973_l982_l978_DUPLICATE_189a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l970_l986_l973_l982_l978_DUPLICATE_189a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l970_l986_l973_l982_l978_DUPLICATE_189a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l994_l982_DUPLICATE_97c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l994_l982_DUPLICATE_97c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l970_l973_l982_l957_l994_l978_DUPLICATE_eb0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l970_l973_l982_l957_l994_l978_DUPLICATE_eb0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l970_l973_l982_l957_l994_l978_DUPLICATE_eb0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l970_l973_l982_l957_l994_l978_DUPLICATE_eb0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l970_l973_l982_l957_l994_l978_DUPLICATE_eb0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l970_l973_l982_l957_l994_l978_DUPLICATE_eb0e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l957_c2_b0f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l989_c30_5b6b_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l987_c3_b974] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_left;
     BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_return_output := BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l997_c21_0a38] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l997_c21_0a38_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l997_c31_d978_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l994_c7_e923] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l994_c7_e923] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l979_c3_0327] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_left;
     BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_return_output := BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l986_c7_61b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l994_c7_e923] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l979_c3_0327_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_right := VAR_BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l987_c3_b974_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l997_c21_0a38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l975_l984_DUPLICATE_cd31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_e923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_e923_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_e923_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l988_c11_4132] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_left;
     BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_return_output := BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l986_c7_61b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l982_c7_2ae2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;

     -- t16_MUX[uxn_opcodes_h_l978_c7_9895] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l978_c7_9895_cond <= VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_cond;
     t16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue;
     t16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_return_output := t16_MUX_uxn_opcodes_h_l978_c7_9895_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l986_c7_61b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l994_c7_e923] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_cond;
     result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_return_output := result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l986_c7_61b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l986_c7_61b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l986_c7_61b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_cond;
     n16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue;
     n16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output := n16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_e923_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse := VAR_t16_MUX_uxn_opcodes_h_l978_c7_9895_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l982_c7_2ae2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;

     -- t16_MUX[uxn_opcodes_h_l973_c7_6877] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l973_c7_6877_cond <= VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_cond;
     t16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue;
     t16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_return_output := t16_MUX_uxn_opcodes_h_l973_c7_6877_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l978_c7_9895] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l986_c7_61b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_cond;
     tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output := tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l982_c7_2ae2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond <= VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond;
     n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue;
     n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output := n16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l982_c7_2ae2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l982_c7_2ae2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l992_c21_c40c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l992_c21_c40c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l988_c11_4132_return_output);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l992_c21_c40c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse := VAR_n16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l978_c7_9895_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l973_c7_6877_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l982_c7_2ae2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_cond;
     tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output := tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;

     -- t16_MUX[uxn_opcodes_h_l970_c7_a2ae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond <= VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond;
     t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue;
     t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output := t16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l978_c7_9895] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l978_c7_9895_cond <= VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_cond;
     n16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue;
     n16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_return_output := n16_MUX_uxn_opcodes_h_l978_c7_9895_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l978_c7_9895] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l978_c7_9895] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l973_c7_6877] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l986_c7_61b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l978_c7_9895] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse := VAR_n16_MUX_uxn_opcodes_h_l978_c7_9895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l978_c7_9895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l973_c7_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l978_c7_9895_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l978_c7_9895_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c7_61b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l978_c7_9895] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l978_c7_9895_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_cond;
     tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iftrue;
     tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_return_output := tmp16_MUX_uxn_opcodes_h_l978_c7_9895_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l973_c7_6877] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_return_output;

     -- t16_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := t16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l982_c7_2ae2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output := result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;

     -- n16_MUX[uxn_opcodes_h_l973_c7_6877] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l973_c7_6877_cond <= VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_cond;
     n16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue;
     n16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_return_output := n16_MUX_uxn_opcodes_h_l973_c7_6877_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l973_c7_6877] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l973_c7_6877] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l970_c7_a2ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l973_c7_6877_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l973_c7_6877_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l973_c7_6877_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l973_c7_6877_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l982_c7_2ae2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l978_c7_9895_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l978_c7_9895] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_cond;
     result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_return_output := result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l970_c7_a2ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l973_c7_6877] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l973_c7_6877_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_cond;
     tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iftrue;
     tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_return_output := tmp16_MUX_uxn_opcodes_h_l973_c7_6877_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l970_c7_a2ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l970_c7_a2ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond;
     n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue;
     n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output := n16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l970_c7_a2ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l978_c7_9895_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l973_c7_6877_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l973_c7_6877] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_cond;
     result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_return_output := result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l970_c7_a2ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_cond;
     tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output := tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := n16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l973_c7_6877_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l970_c7_a2ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l970_c7_a2ae_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l957_c2_b0f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1001_l953_DUPLICATE_2961 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1001_l953_DUPLICATE_2961_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l957_c2_b0f6_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1001_l953_DUPLICATE_2961_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1001_l953_DUPLICATE_2961_return_output;
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
