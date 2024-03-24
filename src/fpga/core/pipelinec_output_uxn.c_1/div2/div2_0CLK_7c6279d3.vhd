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
-- Submodules: 73
entity div2_0CLK_7c6279d3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_7c6279d3;
architecture arch of div2_0CLK_7c6279d3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2091_c6_6993]
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2091_c2_7e4c]
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_8c03]
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2104_c7_3bff]
signal t16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2104_c7_3bff]
signal n16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_3bff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_3bff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_3bff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_3bff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2104_c7_3bff]
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2104_c7_3bff]
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_ab0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2107_c7_7c56]
signal t16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2107_c7_7c56]
signal n16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_7c56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_7c56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_7c56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c7_7c56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2107_c7_7c56]
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2107_c7_7c56]
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_6c1d]
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2112_c7_c8ee]
signal t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2112_c7_c8ee]
signal n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_c8ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_c8ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_c8ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_c8ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2112_c7_c8ee]
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2112_c7_c8ee]
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2113_c3_05ca]
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_c0d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2116_c7_4df4]
signal n16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_4df4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_4df4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_4df4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_4df4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2116_c7_4df4]
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2116_c7_4df4]
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_c266]
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2120_c7_76cb]
signal n16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_76cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_76cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_76cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_76cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_76cb]
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2120_c7_76cb]
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2121_c3_63a7]
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_818a]
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2122_c26_e90e]
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2122_c11_f59f]
signal MUX_uxn_opcodes_h_l2122_c11_f59f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_f59f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_f59f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_f59f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2123_c30_1a16]
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_e9e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_6642]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_6642]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_6642]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_6642]
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2131_c31_eab7]
signal CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_left,
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_right,
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output);

-- t16_MUX_uxn_opcodes_h_l2091_c2_7e4c
t16_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- n16_MUX_uxn_opcodes_h_l2091_c2_7e4c
n16_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c
tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond,
tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_left,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_right,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output);

-- t16_MUX_uxn_opcodes_h_l2104_c7_3bff
t16_MUX_uxn_opcodes_h_l2104_c7_3bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond,
t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue,
t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse,
t16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output);

-- n16_MUX_uxn_opcodes_h_l2104_c7_3bff
n16_MUX_uxn_opcodes_h_l2104_c7_3bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond,
n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue,
n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse,
n16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff
tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond,
tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue,
tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse,
tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output);

-- t16_MUX_uxn_opcodes_h_l2107_c7_7c56
t16_MUX_uxn_opcodes_h_l2107_c7_7c56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond,
t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue,
t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse,
t16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output);

-- n16_MUX_uxn_opcodes_h_l2107_c7_7c56
n16_MUX_uxn_opcodes_h_l2107_c7_7c56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond,
n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue,
n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse,
n16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_cond,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56
tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond,
tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue,
tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse,
tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_left,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_right,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output);

-- t16_MUX_uxn_opcodes_h_l2112_c7_c8ee
t16_MUX_uxn_opcodes_h_l2112_c7_c8ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond,
t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue,
t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse,
t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output);

-- n16_MUX_uxn_opcodes_h_l2112_c7_c8ee
n16_MUX_uxn_opcodes_h_l2112_c7_c8ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond,
n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue,
n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse,
n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee
tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond,
tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue,
tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse,
tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca
BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_left,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_right,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output);

-- n16_MUX_uxn_opcodes_h_l2116_c7_4df4
n16_MUX_uxn_opcodes_h_l2116_c7_4df4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond,
n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue,
n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse,
n16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4
tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond,
tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_left,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_right,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output);

-- n16_MUX_uxn_opcodes_h_l2120_c7_76cb
n16_MUX_uxn_opcodes_h_l2120_c7_76cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond,
n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue,
n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse,
n16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb
tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond,
tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7
BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_left,
BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_right,
BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_left,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_right,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_ccb8c834 port map (
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_left,
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_right,
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_return_output);

-- MUX_uxn_opcodes_h_l2122_c11_f59f
MUX_uxn_opcodes_h_l2122_c11_f59f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2122_c11_f59f_cond,
MUX_uxn_opcodes_h_l2122_c11_f59f_iftrue,
MUX_uxn_opcodes_h_l2122_c11_f59f_iffalse,
MUX_uxn_opcodes_h_l2122_c11_f59f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16
sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_ins,
sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_x,
sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_y,
sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_cond,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7
CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_x,
CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04
CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output,
 t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output,
 t16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output,
 n16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output,
 tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output,
 t16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output,
 n16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output,
 tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output,
 t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output,
 n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output,
 tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output,
 n16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output,
 n16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_return_output,
 MUX_uxn_opcodes_h_l2122_c11_f59f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_return_output,
 CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_20ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_76ee : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_0d40 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_9c41 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_3c78 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_6843 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_9e99_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_bfb0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_da0c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_afa5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2091_l2128_l2116_l2112_l2107_l2104_DUPLICATE_6027_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2116_l2112_l2107_l2104_DUPLICATE_d78b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1543_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1dac_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2121_l2113_l2108_l2117_DUPLICATE_399c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_19d0_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2135_l2087_DUPLICATE_3139_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_9c41 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_9c41;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_da0c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_da0c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_0d40 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_0d40;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_20ae := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_20ae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_6843 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_6843;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_bfb0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_bfb0;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_76ee := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_76ee;
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_3c78 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_3c78;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_e9e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_818a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_c0d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1dac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1dac_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2121_l2113_l2108_l2117_DUPLICATE_399c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2121_l2113_l2108_l2117_DUPLICATE_399c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_ab0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2091_c6_6993] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_left;
     BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output := BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2091_l2128_l2116_l2112_l2107_l2104_DUPLICATE_6027 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2091_l2128_l2116_l2112_l2107_l2104_DUPLICATE_6027_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2123_c30_1a16] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_ins;
     sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_x;
     sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_return_output := sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_19d0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_19d0_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2131_c31_eab7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_return_output := CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_6c1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_c266] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_left;
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output := BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_8c03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2116_l2112_l2107_l2104_DUPLICATE_d78b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2116_l2112_l2107_l2104_DUPLICATE_d78b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1543 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1543_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6993_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_8c03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_ab0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_6c1d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_c0d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_c266_return_output;
     VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_818a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e9e6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2121_l2113_l2108_l2117_DUPLICATE_399c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2121_l2113_l2108_l2117_DUPLICATE_399c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2121_l2113_l2108_l2117_DUPLICATE_399c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2116_l2112_l2107_l2104_DUPLICATE_d78b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2116_l2112_l2107_l2104_DUPLICATE_d78b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2116_l2112_l2107_l2104_DUPLICATE_d78b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2116_l2112_l2107_l2104_DUPLICATE_d78b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2116_l2112_l2107_l2104_DUPLICATE_d78b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1543_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1543_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1543_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1543_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1543_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1543_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1dac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1dac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1dac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1dac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_1dac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_19d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_19d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2091_l2128_l2116_l2112_l2107_l2104_DUPLICATE_6027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2091_l2128_l2116_l2112_l2107_l2104_DUPLICATE_6027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2091_l2128_l2116_l2112_l2107_l2104_DUPLICATE_6027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2091_l2128_l2116_l2112_l2107_l2104_DUPLICATE_6027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2091_l2128_l2116_l2112_l2107_l2104_DUPLICATE_6027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2091_l2128_l2116_l2112_l2107_l2104_DUPLICATE_6027_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_7e4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_1a16_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2121_c3_63a7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_left;
     BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_return_output := BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2131_c21_afa5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_afa5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_eab7_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_6642] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_76cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2113_c3_05ca] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_left;
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_return_output := BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_6642] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_6642] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_05ca_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_63a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_afa5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_3e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_6642_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_6642_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_6642_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_76cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l2112_c7_c8ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond;
     t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue;
     t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output := t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2122_c26_e90e] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_left;
     BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_return_output := BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2120_c7_76cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond;
     n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue;
     n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output := n16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_6642] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_return_output := result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_4df4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_76cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_76cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_e90e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_6642_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_4df4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2107_c7_7c56] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond;
     t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue;
     t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output := t16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_c8ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l2116_c7_4df4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond;
     n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue;
     n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output := n16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;

     -- MUX[uxn_opcodes_h_l2122_c11_f59f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2122_c11_f59f_cond <= VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_cond;
     MUX_uxn_opcodes_h_l2122_c11_f59f_iftrue <= VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_iftrue;
     MUX_uxn_opcodes_h_l2122_c11_f59f_iffalse <= VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_return_output := MUX_uxn_opcodes_h_l2122_c11_f59f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_4df4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_4df4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue := VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c7_7c56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2120_c7_76cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_cond;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output := tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l2104_c7_3bff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond;
     t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue;
     t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output := t16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;

     -- n16_MUX[uxn_opcodes_h_l2112_c7_c8ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond;
     n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue;
     n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output := n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2126_c21_9e99] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_9e99_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2122_c11_f59f_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_c8ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_c8ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_c8ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_9e99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2116_c7_4df4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_cond;
     tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output := tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_3bff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_7c56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;

     -- t16_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2107_c7_7c56] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond;
     n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue;
     n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output := n16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_7c56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_76cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_7c56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_76cb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_3bff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_3bff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_3bff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2116_c7_4df4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2104_c7_3bff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond;
     n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue;
     n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output := n16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2112_c7_c8ee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond;
     tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output := tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_4df4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;
     -- n16_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2112_c7_c8ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2107_c7_7c56] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_cond;
     tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output := tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c8ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2104_c7_3bff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_cond;
     tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output := tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2107_c7_7c56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output := result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7c56_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2104_c7_3bff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_3bff_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2091_c2_7e4c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2135_l2087_DUPLICATE_3139 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2135_l2087_DUPLICATE_3139_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_7e4c_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2135_l2087_DUPLICATE_3139_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2135_l2087_DUPLICATE_3139_return_output;
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
