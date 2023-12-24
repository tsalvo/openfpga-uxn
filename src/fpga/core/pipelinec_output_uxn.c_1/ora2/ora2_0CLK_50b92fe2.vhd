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
entity ora2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_50b92fe2;
architecture arch of ora2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1042_c6_6360]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1042_c2_0ed6]
signal t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_f159]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1055_c7_8561]
signal n16_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1055_c7_8561]
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_8561]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_8561]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_8561]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1055_c7_8561]
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_8561]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1055_c7_8561]
signal t16_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_e665]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1058_c7_88da]
signal n16_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1058_c7_88da]
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1058_c7_88da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1058_c7_88da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1058_c7_88da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1058_c7_88da]
signal result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1058_c7_88da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1058_c7_88da]
signal t16_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_2b43]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1063_c7_2da0]
signal n16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1063_c7_2da0]
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_2da0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_2da0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_2da0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1063_c7_2da0]
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_2da0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1063_c7_2da0]
signal t16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1064_c3_a654]
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_e42b]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1067_c7_aec9]
signal n16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1067_c7_aec9]
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_aec9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_aec9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_aec9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1067_c7_aec9]
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_aec9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1071_c11_047c]
signal BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1071_c7_00e3]
signal n16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1071_c7_00e3]
signal tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1071_c7_00e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1071_c7_00e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1071_c7_00e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1071_c7_00e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1071_c7_00e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1072_c3_9a3f]
signal BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1073_c11_ba8e]
signal BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1074_c30_6943]
signal sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_110e]
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c7_fab6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1079_c7_fab6]
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_fab6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_fab6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1082_c31_2f13]
signal CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360
BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output);

-- n16_MUX_uxn_opcodes_h_l1042_c2_0ed6
n16_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6
tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6
result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6
result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6
result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6
result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- t16_MUX_uxn_opcodes_h_l1042_c2_0ed6
t16_MUX_uxn_opcodes_h_l1042_c2_0ed6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond,
t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue,
t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse,
t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output);

-- n16_MUX_uxn_opcodes_h_l1055_c7_8561
n16_MUX_uxn_opcodes_h_l1055_c7_8561 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1055_c7_8561_cond,
n16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue,
n16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse,
n16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1055_c7_8561
tmp16_MUX_uxn_opcodes_h_l1055_c7_8561 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_cond,
tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue,
tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse,
tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_cond,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_return_output);

-- t16_MUX_uxn_opcodes_h_l1055_c7_8561
t16_MUX_uxn_opcodes_h_l1055_c7_8561 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1055_c7_8561_cond,
t16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue,
t16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse,
t16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output);

-- n16_MUX_uxn_opcodes_h_l1058_c7_88da
n16_MUX_uxn_opcodes_h_l1058_c7_88da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1058_c7_88da_cond,
n16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue,
n16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse,
n16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1058_c7_88da
tmp16_MUX_uxn_opcodes_h_l1058_c7_88da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_cond,
tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue,
tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse,
tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da
result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_cond,
result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_return_output);

-- t16_MUX_uxn_opcodes_h_l1058_c7_88da
t16_MUX_uxn_opcodes_h_l1058_c7_88da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1058_c7_88da_cond,
t16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue,
t16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse,
t16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output);

-- n16_MUX_uxn_opcodes_h_l1063_c7_2da0
n16_MUX_uxn_opcodes_h_l1063_c7_2da0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond,
n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue,
n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse,
n16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0
tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond,
tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output);

-- t16_MUX_uxn_opcodes_h_l1063_c7_2da0
t16_MUX_uxn_opcodes_h_l1063_c7_2da0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond,
t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue,
t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse,
t16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654
BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_left,
BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_right,
BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output);

-- n16_MUX_uxn_opcodes_h_l1067_c7_aec9
n16_MUX_uxn_opcodes_h_l1067_c7_aec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond,
n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue,
n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse,
n16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9
tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond,
tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_left,
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_right,
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output);

-- n16_MUX_uxn_opcodes_h_l1071_c7_00e3
n16_MUX_uxn_opcodes_h_l1071_c7_00e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond,
n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue,
n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse,
n16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3
tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond,
tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3
result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f
BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_left,
BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_right,
BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e
BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_left,
BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_right,
BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1074_c30_6943
sp_relative_shift_uxn_opcodes_h_l1074_c30_6943 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_ins,
sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_x,
sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_y,
sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_left,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_right,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6
result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13
CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_x,
CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0
CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output,
 n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output,
 n16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output,
 tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_return_output,
 t16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output,
 n16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output,
 tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_return_output,
 t16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output,
 n16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output,
 t16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output,
 n16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output,
 n16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_return_output,
 sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output,
 CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1047_c3_7682 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_f793 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1056_c3_f69e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_3a8c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_cde6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_f1f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1077_c21_f081_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1080_c3_94cb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1081_c3_5ac9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1082_c21_64e5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1079_l1042_l1067_l1055_l1058_l1063_DUPLICATE_cbbd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1079_l1067_l1055_l1058_l1063_DUPLICATE_effb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1071_l1067_l1055_l1058_l1063_DUPLICATE_2d6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1079_l1071_l1067_l1055_l1058_l1063_DUPLICATE_82fc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1064_l1072_l1068_l1059_DUPLICATE_8bfa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1079_l1067_DUPLICATE_c4ad_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1038_l1086_DUPLICATE_4f5b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_f1f8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_f1f8;
     VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_f793 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_f793;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1047_c3_7682 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1047_c3_7682;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1080_c3_94cb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1080_c3_94cb;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_3a8c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_3a8c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1056_c3_f69e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1056_c3_f69e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1081_c3_5ac9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1081_c3_5ac9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_cde6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_cde6;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1079_l1042_l1067_l1055_l1058_l1063_DUPLICATE_cbbd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1079_l1042_l1067_l1055_l1058_l1063_DUPLICATE_cbbd_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1064_l1072_l1068_l1059_DUPLICATE_8bfa LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1064_l1072_l1068_l1059_DUPLICATE_8bfa_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1079_l1067_DUPLICATE_c4ad LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1079_l1067_DUPLICATE_c4ad_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1082_c31_2f13] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_return_output := CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_f159] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c6_6360] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1071_c11_047c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1071_l1067_l1055_l1058_l1063_DUPLICATE_2d6e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1071_l1067_l1055_l1058_l1063_DUPLICATE_2d6e_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1074_c30_6943] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_ins;
     sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_x;
     sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_return_output := sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_e42b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1079_l1071_l1067_l1055_l1058_l1063_DUPLICATE_82fc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1079_l1071_l1067_l1055_l1058_l1063_DUPLICATE_82fc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_2b43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1079_l1067_l1055_l1058_l1063_DUPLICATE_effb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1079_l1067_l1055_l1058_l1063_DUPLICATE_effb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_110e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_e665] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_6360_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f159_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_e665_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b43_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_e42b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_047c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_110e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1064_l1072_l1068_l1059_DUPLICATE_8bfa_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1064_l1072_l1068_l1059_DUPLICATE_8bfa_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1064_l1072_l1068_l1059_DUPLICATE_8bfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1079_l1067_l1055_l1058_l1063_DUPLICATE_effb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1079_l1067_l1055_l1058_l1063_DUPLICATE_effb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1079_l1067_l1055_l1058_l1063_DUPLICATE_effb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1079_l1067_l1055_l1058_l1063_DUPLICATE_effb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1079_l1067_l1055_l1058_l1063_DUPLICATE_effb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1079_l1071_l1067_l1055_l1058_l1063_DUPLICATE_82fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1079_l1071_l1067_l1055_l1058_l1063_DUPLICATE_82fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1079_l1071_l1067_l1055_l1058_l1063_DUPLICATE_82fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1079_l1071_l1067_l1055_l1058_l1063_DUPLICATE_82fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1079_l1071_l1067_l1055_l1058_l1063_DUPLICATE_82fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1079_l1071_l1067_l1055_l1058_l1063_DUPLICATE_82fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1071_l1067_l1055_l1058_l1063_DUPLICATE_2d6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1071_l1067_l1055_l1058_l1063_DUPLICATE_2d6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1071_l1067_l1055_l1058_l1063_DUPLICATE_2d6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1071_l1067_l1055_l1058_l1063_DUPLICATE_2d6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1071_l1067_l1055_l1058_l1063_DUPLICATE_2d6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1079_l1067_DUPLICATE_c4ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1079_l1067_DUPLICATE_c4ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1079_l1042_l1067_l1055_l1058_l1063_DUPLICATE_cbbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1079_l1042_l1067_l1055_l1058_l1063_DUPLICATE_cbbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1079_l1042_l1067_l1055_l1058_l1063_DUPLICATE_cbbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1079_l1042_l1067_l1055_l1058_l1063_DUPLICATE_cbbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1079_l1042_l1067_l1055_l1058_l1063_DUPLICATE_cbbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1079_l1042_l1067_l1055_l1058_l1063_DUPLICATE_cbbd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1042_c2_0ed6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_6943_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1064_c3_a654] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_left;
     BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_return_output := BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c7_fab6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_fab6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1072_c3_9a3f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_left;
     BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_return_output := BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1071_c7_00e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1082_c21_64e5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1082_c21_64e5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_2f13_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_fab6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a654_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_9a3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1082_c21_64e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1060_DUPLICATE_15b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_aec9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1071_c7_00e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1071_c7_00e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1073_c11_ba8e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_left;
     BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_return_output := BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1079_c7_fab6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1071_c7_00e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1071_c7_00e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond;
     n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue;
     n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output := n16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1063_c7_2da0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond;
     t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue;
     t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output := t16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_fab6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_2da0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_aec9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1067_c7_aec9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond;
     n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue;
     n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output := n16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1077_c21_f081] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1077_c21_f081_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_ba8e_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1071_c7_00e3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_cond;
     tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output := tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_aec9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_aec9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1058_c7_88da] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1058_c7_88da_cond <= VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_cond;
     t16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue;
     t16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output := t16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1077_c21_f081_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1058_c7_88da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_2da0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1067_c7_aec9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_cond;
     tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output := tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1063_c7_2da0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond;
     n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue;
     n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output := n16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_2da0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1071_c7_00e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_2da0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1055_c7_8561] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1055_c7_8561_cond <= VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_cond;
     t16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue;
     t16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output := t16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_00e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1058_c7_88da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1067_c7_aec9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1063_c7_2da0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_cond;
     tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output := tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1058_c7_88da] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1058_c7_88da_cond <= VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_cond;
     n16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue;
     n16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output := n16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1058_c7_88da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_8561] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;

     -- t16_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1058_c7_88da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_aec9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_8561] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1063_c7_2da0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1055_c7_8561] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1055_c7_8561_cond <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_cond;
     n16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue;
     n16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output := n16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_8561] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1058_c7_88da] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_cond;
     tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output := tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_8561] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_2da0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1055_c7_8561] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_cond;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output := tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;

     -- n16_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1058_c7_88da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_return_output := result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_88da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1055_c7_8561] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_return_output := result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_8561_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1042_c2_0ed6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1038_l1086_DUPLICATE_4f5b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1038_l1086_DUPLICATE_4f5b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_0ed6_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1038_l1086_DUPLICATE_4f5b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1038_l1086_DUPLICATE_4f5b_return_output;
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
