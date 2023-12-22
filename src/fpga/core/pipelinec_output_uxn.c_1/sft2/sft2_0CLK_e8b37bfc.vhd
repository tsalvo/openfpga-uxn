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
-- Submodules: 64
entity sft2_0CLK_e8b37bfc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_e8b37bfc;
architecture arch of sft2_0CLK_e8b37bfc is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2269_c6_e889]
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal n16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal t8_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2269_c2_98ae]
signal tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2282_c11_00a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2282_c7_b466]
signal n16_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2282_c7_b466]
signal t8_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2282_c7_b466]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2282_c7_b466]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2282_c7_b466]
signal result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2282_c7_b466]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2282_c7_b466]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2282_c7_b466]
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2285_c11_d9f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2285_c7_a881]
signal n16_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2285_c7_a881]
signal t8_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2285_c7_a881]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2285_c7_a881]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2285_c7_a881]
signal result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2285_c7_a881]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2285_c7_a881]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2285_c7_a881]
signal tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2289_c11_58c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2289_c7_16ec]
signal n16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2289_c7_16ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2289_c7_16ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2289_c7_16ec]
signal result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2289_c7_16ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2289_c7_16ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2289_c7_16ec]
signal tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2291_c3_39fc]
signal CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2293_c11_bf5c]
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2293_c7_2004]
signal n16_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c7_2004]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c7_2004]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2293_c7_2004]
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c7_2004]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c7_2004]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2293_c7_2004]
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2294_c3_fc5b]
signal BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2295_c30_fe6e]
signal sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2296_c20_c990]
signal BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2296_c12_09e8]
signal BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2296_c36_af86]
signal CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2296_c12_0369]
signal BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_29d1]
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_deca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_deca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_deca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2301_c7_deca]
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2304_c31_f7ce]
signal CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889
BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_left,
BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_right,
BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output);

-- n16_MUX_uxn_opcodes_h_l2269_c2_98ae
n16_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
n16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- t8_MUX_uxn_opcodes_h_l2269_c2_98ae
t8_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
t8_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae
result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae
result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae
result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae
result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae
tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond,
tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output);

-- n16_MUX_uxn_opcodes_h_l2282_c7_b466
n16_MUX_uxn_opcodes_h_l2282_c7_b466 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2282_c7_b466_cond,
n16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue,
n16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse,
n16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output);

-- t8_MUX_uxn_opcodes_h_l2282_c7_b466
t8_MUX_uxn_opcodes_h_l2282_c7_b466 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2282_c7_b466_cond,
t8_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue,
t8_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse,
t8_MUX_uxn_opcodes_h_l2282_c7_b466_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466
result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_cond,
result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2282_c7_b466
tmp16_MUX_uxn_opcodes_h_l2282_c7_b466 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_cond,
tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue,
tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse,
tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8
BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output);

-- n16_MUX_uxn_opcodes_h_l2285_c7_a881
n16_MUX_uxn_opcodes_h_l2285_c7_a881 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2285_c7_a881_cond,
n16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue,
n16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse,
n16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output);

-- t8_MUX_uxn_opcodes_h_l2285_c7_a881
t8_MUX_uxn_opcodes_h_l2285_c7_a881 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2285_c7_a881_cond,
t8_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue,
t8_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse,
t8_MUX_uxn_opcodes_h_l2285_c7_a881_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881
result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_cond,
result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881
result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2285_c7_a881
tmp16_MUX_uxn_opcodes_h_l2285_c7_a881 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_cond,
tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue,
tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse,
tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3
BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output);

-- n16_MUX_uxn_opcodes_h_l2289_c7_16ec
n16_MUX_uxn_opcodes_h_l2289_c7_16ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond,
n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue,
n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse,
n16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec
result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec
result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_cond,
result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec
result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec
tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond,
tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue,
tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse,
tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc
CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_x,
CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_left,
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_right,
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output);

-- n16_MUX_uxn_opcodes_h_l2293_c7_2004
n16_MUX_uxn_opcodes_h_l2293_c7_2004 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2293_c7_2004_cond,
n16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue,
n16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse,
n16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004
result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_cond,
result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2293_c7_2004
tmp16_MUX_uxn_opcodes_h_l2293_c7_2004 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_cond,
tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue,
tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse,
tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b
BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_left,
BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_right,
BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e
sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_ins,
sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_x,
sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_y,
sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990
BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_left,
BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_right,
BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8
BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_left,
BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_right,
BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2296_c36_af86
CONST_SR_4_uxn_opcodes_h_l2296_c36_af86 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_x,
CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369
BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_left,
BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_right,
BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_left,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_right,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_cond,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce
CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_x,
CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output,
 n16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 t8_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output,
 n16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output,
 t8_MUX_uxn_opcodes_h_l2282_c7_b466_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_return_output,
 tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output,
 n16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output,
 t8_MUX_uxn_opcodes_h_l2285_c7_a881_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_return_output,
 tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output,
 n16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output,
 CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output,
 n16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_return_output,
 tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_return_output,
 sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_return_output,
 CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_return_output,
 CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2279_c3_0f05 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2274_c3_c577 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2283_c3_7e4e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2287_c3_802e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2298_c3_7e53 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2299_c21_7cf1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_cd5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2302_c3_b202 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2304_c21_01a9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2269_l2301_DUPLICATE_df4c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2301_l2293_DUPLICATE_53d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2285_l2289_l2282_l2293_DUPLICATE_238a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2285_l2301_l2289_l2282_DUPLICATE_f8c1_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2290_l2294_DUPLICATE_e967_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2289_DUPLICATE_23a9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2264_l2308_DUPLICATE_66fb_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_y := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2302_c3_b202 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2302_c3_b202;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2287_c3_802e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2287_c3_802e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2298_c3_7e53 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2298_c3_7e53;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2283_c3_7e4e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2283_c3_7e4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_cd5b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_cd5b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2274_c3_c577 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2274_c3_c577;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2279_c3_0f05 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2279_c3_0f05;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2282_c11_00a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2295_c30_fe6e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_ins;
     sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_x;
     sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_return_output := sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2269_l2301_DUPLICATE_df4c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2269_l2301_DUPLICATE_df4c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2285_c11_d9f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2289_c11_58c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2285_l2289_l2282_l2293_DUPLICATE_238a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2285_l2289_l2282_l2293_DUPLICATE_238a_return_output := result.is_stack_write;

     -- CONST_SR_4[uxn_opcodes_h_l2296_c36_af86] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_return_output := CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2293_c11_bf5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2301_l2293_DUPLICATE_53d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2301_l2293_DUPLICATE_53d1_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2285_l2301_l2289_l2282_DUPLICATE_f8c1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2285_l2301_l2289_l2282_DUPLICATE_f8c1_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2290_l2294_DUPLICATE_e967 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2290_l2294_DUPLICATE_e967_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l2304_c31_f7ce] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_return_output := CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2269_c6_e889] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_left;
     BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output := BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2289_DUPLICATE_23a9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2289_DUPLICATE_23a9_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output := result.is_stack_index_flipped;

     -- BIN_OP_AND[uxn_opcodes_h_l2296_c20_c990] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_left;
     BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_return_output := BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_29d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2296_c20_c990_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c6_e889_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_00a0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_d9f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_58c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_bf5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_29d1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2290_l2294_DUPLICATE_e967_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2290_l2294_DUPLICATE_e967_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2285_l2301_l2289_l2282_DUPLICATE_f8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2285_l2301_l2289_l2282_DUPLICATE_f8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2285_l2301_l2289_l2282_DUPLICATE_f8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2285_l2301_l2289_l2282_DUPLICATE_f8c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2301_l2293_DUPLICATE_53d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2301_l2293_DUPLICATE_53d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2301_l2293_DUPLICATE_53d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2301_l2293_DUPLICATE_53d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2301_l2293_DUPLICATE_53d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2285_l2289_l2282_l2293_DUPLICATE_238a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2285_l2289_l2282_l2293_DUPLICATE_238a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2285_l2289_l2282_l2293_DUPLICATE_238a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2285_l2289_l2282_l2293_DUPLICATE_238a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2289_DUPLICATE_23a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2301_l2289_DUPLICATE_23a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2269_l2301_DUPLICATE_df4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2269_l2301_DUPLICATE_df4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2269_l2301_DUPLICATE_df4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2269_l2301_DUPLICATE_df4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2289_l2285_l2282_l2269_l2301_DUPLICATE_df4c_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_right := VAR_CONST_SR_4_uxn_opcodes_h_l2296_c36_af86_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2269_c2_98ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2295_c30_fe6e_return_output;
     -- t8_MUX[uxn_opcodes_h_l2285_c7_a881] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2285_c7_a881_cond <= VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_cond;
     t8_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue;
     t8_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_return_output := t8_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2304_c21_01a9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2304_c21_01a9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2304_c31_f7ce_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2294_c3_fc5b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_left;
     BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_return_output := BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_deca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2291_c3_39fc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_return_output := CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c7_2004] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_deca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_deca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2294_c3_fc5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2304_c21_01a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2291_c3_39fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_deca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_deca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_deca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;
     -- BIN_OP_SR[uxn_opcodes_h_l2296_c12_09e8] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_left;
     BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_return_output := BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c7_2004] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c7_2004] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c7_2004] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;

     -- t8_MUX[uxn_opcodes_h_l2282_c7_b466] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2282_c7_b466_cond <= VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_cond;
     t8_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue;
     t8_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_return_output := t8_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2301_c7_deca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_return_output := result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2289_c7_16ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;

     -- n16_MUX[uxn_opcodes_h_l2293_c7_2004] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2293_c7_2004_cond <= VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_cond;
     n16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue;
     n16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output := n16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2296_c12_09e8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2301_c7_deca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2289_c7_16ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2296_c12_0369] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_left;
     BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_return_output := BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2285_c7_a881] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;

     -- t8_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := t8_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2289_c7_16ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2289_c7_16ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;

     -- n16_MUX[uxn_opcodes_h_l2289_c7_16ec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond <= VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond;
     n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue;
     n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output := n16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2299_c21_7cf1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2299_c21_7cf1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2296_c12_0369_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2293_c7_2004] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_cond;
     tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output := tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2282_c7_b466] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;

     -- n16_MUX[uxn_opcodes_h_l2285_c7_a881] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2285_c7_a881_cond <= VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_cond;
     n16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue;
     n16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output := n16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2285_c7_a881] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2285_c7_a881] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2285_c7_a881] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2299_c21_7cf1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;
     -- n16_MUX[uxn_opcodes_h_l2282_c7_b466] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2282_c7_b466_cond <= VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_cond;
     n16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue;
     n16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output := n16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2289_c7_16ec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_cond;
     tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output := tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2282_c7_b466] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2293_c7_2004] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_return_output := result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2282_c7_b466] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2282_c7_b466] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_2004_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := n16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2285_c7_a881] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_cond;
     tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output := tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2289_c7_16ec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output := result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_16ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2282_c7_b466] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_cond;
     tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output := tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2285_c7_a881] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_return_output := result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c7_a881_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2282_c7_b466] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_return_output := result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2282_c7_b466_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2269_c2_98ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2264_l2308_DUPLICATE_66fb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2264_l2308_DUPLICATE_66fb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2269_c2_98ae_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2264_l2308_DUPLICATE_66fb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2264_l2308_DUPLICATE_66fb_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
