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
entity mul2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_50b92fe2;
architecture arch of mul2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2027_c6_e98f]
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2027_c2_ae3c]
signal n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_72e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2040_c7_a698]
signal tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_a698]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_a698]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_a698]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_a698]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2040_c7_a698]
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2040_c7_a698]
signal t16_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2040_c7_a698]
signal n16_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_0623]
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2043_c7_95d6]
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2043_c7_95d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c7_95d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2043_c7_95d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c7_95d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2043_c7_95d6]
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2043_c7_95d6]
signal t16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2043_c7_95d6]
signal n16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_bf23]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2048_c7_33d2]
signal tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_33d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_33d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_33d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_33d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2048_c7_33d2]
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2048_c7_33d2]
signal t16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2048_c7_33d2]
signal n16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2049_c3_76c3]
signal BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_d1b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2052_c7_a8a7]
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2052_c7_a8a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2052_c7_a8a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2052_c7_a8a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2052_c7_a8a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2052_c7_a8a7]
signal result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2052_c7_a8a7]
signal n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_f02c]
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2056_c7_8bd8]
signal tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2056_c7_8bd8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2056_c7_8bd8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2056_c7_8bd8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2056_c7_8bd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2056_c7_8bd8]
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2056_c7_8bd8]
signal n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2057_c3_e6c9]
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2058_c11_65a3]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2059_c30_a37a]
signal sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_9bdf]
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2064_c7_c411]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2064_c7_c411]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2064_c7_c411]
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2064_c7_c411]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2067_c31_bef3]
signal CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f
BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_left,
BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_right,
BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c
tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c
result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c
result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c
result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c
result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c
result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c
result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- t16_MUX_uxn_opcodes_h_l2027_c2_ae3c
t16_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- n16_MUX_uxn_opcodes_h_l2027_c2_ae3c
n16_MUX_uxn_opcodes_h_l2027_c2_ae3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond,
n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue,
n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse,
n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2040_c7_a698
tmp16_MUX_uxn_opcodes_h_l2040_c7_a698 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_cond,
tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue,
tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse,
tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_cond,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_return_output);

-- t16_MUX_uxn_opcodes_h_l2040_c7_a698
t16_MUX_uxn_opcodes_h_l2040_c7_a698 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2040_c7_a698_cond,
t16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue,
t16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse,
t16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output);

-- n16_MUX_uxn_opcodes_h_l2040_c7_a698
n16_MUX_uxn_opcodes_h_l2040_c7_a698 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2040_c7_a698_cond,
n16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue,
n16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse,
n16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_left,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_right,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6
tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond,
tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output);

-- t16_MUX_uxn_opcodes_h_l2043_c7_95d6
t16_MUX_uxn_opcodes_h_l2043_c7_95d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond,
t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue,
t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse,
t16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output);

-- n16_MUX_uxn_opcodes_h_l2043_c7_95d6
n16_MUX_uxn_opcodes_h_l2043_c7_95d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond,
n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue,
n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse,
n16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2
tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond,
tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output);

-- t16_MUX_uxn_opcodes_h_l2048_c7_33d2
t16_MUX_uxn_opcodes_h_l2048_c7_33d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond,
t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue,
t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse,
t16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output);

-- n16_MUX_uxn_opcodes_h_l2048_c7_33d2
n16_MUX_uxn_opcodes_h_l2048_c7_33d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond,
n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue,
n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse,
n16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3
BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_left,
BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_right,
BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7
tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond,
tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7
result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output);

-- n16_MUX_uxn_opcodes_h_l2052_c7_a8a7
n16_MUX_uxn_opcodes_h_l2052_c7_a8a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond,
n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue,
n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse,
n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_left,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_right,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8
tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond,
tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output);

-- n16_MUX_uxn_opcodes_h_l2056_c7_8bd8
n16_MUX_uxn_opcodes_h_l2056_c7_8bd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond,
n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue,
n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse,
n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9
BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_left,
BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_right,
BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a
sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_ins,
sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_x,
sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_y,
sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_left,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_right,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_cond,
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3
CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_x,
CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035
CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_return_output,
 t16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output,
 n16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output,
 tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output,
 t16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output,
 n16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output,
 tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output,
 t16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output,
 n16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output,
 n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output,
 n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_return_output,
 sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_return_output,
 CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2032_c3_bf42 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2037_c3_24e5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_2bdc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_8c1d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2050_c3_e03f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2058_c3_4ffc : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_1e66 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2062_c21_2211_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_dd6b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2065_c3_9cfd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2067_c21_29ed_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_5a08_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_7bdc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_c92d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_c80d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2053_l2049_l2044_l2057_DUPLICATE_f21e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2064_l2052_DUPLICATE_ceb8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2071_l2023_DUPLICATE_f0c4_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2032_c3_bf42 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2032_c3_bf42;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_8c1d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_8c1d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2037_c3_24e5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2037_c3_24e5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_dd6b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_dd6b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2050_c3_e03f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2050_c3_e03f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_1e66 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_1e66;
     VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2065_c3_9cfd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2065_c3_9cfd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_2bdc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_2bdc;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse := tmp16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_c92d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_c92d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_9bdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_c80d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_c80d_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2053_l2049_l2044_l2057_DUPLICATE_f21e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2053_l2049_l2044_l2057_DUPLICATE_f21e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l2059_c30_a37a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_ins;
     sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_x;
     sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_return_output := sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_d1b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_72e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2027_c6_e98f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_5a08 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_5a08_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l2067_c31_bef3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_return_output := CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_0623] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_left;
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output := BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_f02c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2064_l2052_DUPLICATE_ceb8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2064_l2052_DUPLICATE_ceb8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_bf23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_7bdc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_7bdc_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_e98f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_72e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_0623_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_bf23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_d1b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f02c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_9bdf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2053_l2049_l2044_l2057_DUPLICATE_f21e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2053_l2049_l2044_l2057_DUPLICATE_f21e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2053_l2049_l2044_l2057_DUPLICATE_f21e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_c92d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_c92d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_c92d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_c92d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_c92d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_c80d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_c80d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_c80d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_c80d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_c80d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_c80d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_7bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_7bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_7bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_7bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_7bdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2064_l2052_DUPLICATE_ceb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2064_l2052_DUPLICATE_ceb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_5a08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_5a08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_5a08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_5a08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_5a08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_5a08_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2027_c2_ae3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_a37a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2056_c7_8bd8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2049_c3_76c3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_left;
     BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_return_output := BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2057_c3_e6c9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_left;
     BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_return_output := BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2067_c21_29ed] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2067_c21_29ed_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_bef3_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2064_c7_c411] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2064_c7_c411] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2064_c7_c411] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_76c3_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_e6c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2067_c21_29ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2054_l2045_DUPLICATE_8035_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c411_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c411_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c411_return_output;
     -- n16_MUX[uxn_opcodes_h_l2056_c7_8bd8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond;
     n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue;
     n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output := n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2058_c11_65a3] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2056_c7_8bd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2056_c7_8bd8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2048_c7_33d2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond;
     t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue;
     t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output := t16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2052_c7_a8a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2064_c7_c411] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_return_output := result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2056_c7_8bd8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2058_c3_4ffc := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_65a3_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c411_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue := VAR_tmp16_uxn_opcodes_h_l2058_c3_4ffc;
     -- n16_MUX[uxn_opcodes_h_l2052_c7_a8a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond;
     n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue;
     n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output := n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2056_c7_8bd8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond;
     tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output := tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2052_c7_a8a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2043_c7_95d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond;
     t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue;
     t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output := t16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_33d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2052_c7_a8a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2062_c21_2211] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2062_c21_2211_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2058_c3_4ffc);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2052_c7_a8a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2062_c21_2211_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;
     -- t16_MUX[uxn_opcodes_h_l2040_c7_a698] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2040_c7_a698_cond <= VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_cond;
     t16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue;
     t16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output := t16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_33d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2048_c7_33d2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond;
     n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue;
     n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output := n16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c7_95d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2052_c7_a8a7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond;
     tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output := tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2056_c7_8bd8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_33d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_33d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_8bd8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;
     -- t16_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2043_c7_95d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_a698] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;

     -- n16_MUX[uxn_opcodes_h_l2043_c7_95d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond;
     n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue;
     n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output := n16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c7_95d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2052_c7_a8a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2043_c7_95d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2048_c7_33d2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_cond;
     tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output := tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_a8a7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_a698] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_a698] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2048_c7_33d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_a698] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2043_c7_95d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_cond;
     tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output := tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2040_c7_a698] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2040_c7_a698_cond <= VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_cond;
     n16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue;
     n16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output := n16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_33d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2043_c7_95d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2040_c7_a698] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_cond;
     tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output := tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_95d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2040_c7_a698] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_return_output := result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_a698_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2027_c2_ae3c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2071_l2023_DUPLICATE_f0c4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2071_l2023_DUPLICATE_f0c4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_ae3c_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2071_l2023_DUPLICATE_f0c4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2071_l2023_DUPLICATE_f0c4_return_output;
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
