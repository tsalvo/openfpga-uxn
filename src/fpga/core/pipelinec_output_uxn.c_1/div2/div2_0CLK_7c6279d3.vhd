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
-- BIN_OP_EQ[uxn_opcodes_h_l2091_c6_930d]
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2091_c2_8a9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_b31a]
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2104_c7_5cc1]
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2104_c7_5cc1]
signal n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2104_c7_5cc1]
signal t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2104_c7_5cc1]
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_5cc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_5cc1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_5cc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_5cc1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_5b83]
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2107_c7_7807]
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2107_c7_7807]
signal n16_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2107_c7_7807]
signal t16_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2107_c7_7807]
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_7807]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c7_7807]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_7807]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_7807]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_5553]
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2112_c7_c448]
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2112_c7_c448]
signal n16_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2112_c7_c448]
signal t16_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2112_c7_c448]
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_c448]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_c448]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_c448]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_c448]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2113_c3_e030]
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_4d0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2116_c7_e984]
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2116_c7_e984]
signal n16_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2116_c7_e984]
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_e984]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_e984]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_e984]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_e984]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_608b]
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2120_c7_0997]
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2120_c7_0997]
signal n16_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_0997]
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_0997]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_0997]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_0997]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_0997]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2121_c3_1538]
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_bb7f]
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2122_c26_4315]
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2122_c11_725a]
signal MUX_uxn_opcodes_h_l2122_c11_725a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_725a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_725a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_725a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2123_c30_a6f4]
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_5a16]
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_d8e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_d8e5]
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_d8e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_d8e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2131_c31_e1c4]
signal CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_left,
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_right,
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e
tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- n16_MUX_uxn_opcodes_h_l2091_c2_8a9e
n16_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- t16_MUX_uxn_opcodes_h_l2091_c2_8a9e
t16_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_left,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_right,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1
tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond,
tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output);

-- n16_MUX_uxn_opcodes_h_l2104_c7_5cc1
n16_MUX_uxn_opcodes_h_l2104_c7_5cc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond,
n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue,
n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse,
n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output);

-- t16_MUX_uxn_opcodes_h_l2104_c7_5cc1
t16_MUX_uxn_opcodes_h_l2104_c7_5cc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond,
t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue,
t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse,
t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_left,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_right,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2107_c7_7807
tmp16_MUX_uxn_opcodes_h_l2107_c7_7807 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_cond,
tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue,
tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse,
tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output);

-- n16_MUX_uxn_opcodes_h_l2107_c7_7807
n16_MUX_uxn_opcodes_h_l2107_c7_7807 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2107_c7_7807_cond,
n16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue,
n16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse,
n16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output);

-- t16_MUX_uxn_opcodes_h_l2107_c7_7807
t16_MUX_uxn_opcodes_h_l2107_c7_7807 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2107_c7_7807_cond,
t16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue,
t16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse,
t16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_cond,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_left,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_right,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2112_c7_c448
tmp16_MUX_uxn_opcodes_h_l2112_c7_c448 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_cond,
tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue,
tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse,
tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output);

-- n16_MUX_uxn_opcodes_h_l2112_c7_c448
n16_MUX_uxn_opcodes_h_l2112_c7_c448 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2112_c7_c448_cond,
n16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue,
n16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse,
n16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output);

-- t16_MUX_uxn_opcodes_h_l2112_c7_c448
t16_MUX_uxn_opcodes_h_l2112_c7_c448 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2112_c7_c448_cond,
t16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue,
t16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse,
t16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_cond,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030
BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_left,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_right,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2116_c7_e984
tmp16_MUX_uxn_opcodes_h_l2116_c7_e984 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_cond,
tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue,
tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse,
tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output);

-- n16_MUX_uxn_opcodes_h_l2116_c7_e984
n16_MUX_uxn_opcodes_h_l2116_c7_e984 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2116_c7_e984_cond,
n16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue,
n16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse,
n16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_cond,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_left,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_right,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2120_c7_0997
tmp16_MUX_uxn_opcodes_h_l2120_c7_0997 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_cond,
tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue,
tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse,
tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output);

-- n16_MUX_uxn_opcodes_h_l2120_c7_0997
n16_MUX_uxn_opcodes_h_l2120_c7_0997 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2120_c7_0997_cond,
n16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue,
n16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse,
n16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_cond,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538
BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_left,
BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_right,
BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_left,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_right,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_ccb8c834 port map (
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_left,
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_right,
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_return_output);

-- MUX_uxn_opcodes_h_l2122_c11_725a
MUX_uxn_opcodes_h_l2122_c11_725a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2122_c11_725a_cond,
MUX_uxn_opcodes_h_l2122_c11_725a_iftrue,
MUX_uxn_opcodes_h_l2122_c11_725a_iffalse,
MUX_uxn_opcodes_h_l2122_c11_725a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4
sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_ins,
sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_x,
sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_y,
sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_left,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_right,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4
CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_x,
CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10
CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output,
 n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output,
 t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output,
 tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output,
 n16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output,
 t16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output,
 tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output,
 n16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output,
 t16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output,
 n16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output,
 n16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_return_output,
 MUX_uxn_opcodes_h_l2122_c11_725a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output,
 CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_f71b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_6e46 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_925e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_2d97 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_5f89 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_9a05 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_725a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_725a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_725a_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_725a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_94d4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_bb79 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_7743 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_9f79_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2091_l2128_l2116_DUPLICATE_3e91_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2120_l2116_DUPLICATE_ce1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2120_l2116_DUPLICATE_2d8d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2116_DUPLICATE_165f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2121_l2113_l2117_DUPLICATE_a303_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_0ead_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2135_l2087_DUPLICATE_0e99_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_9a05 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_9a05;
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_f71b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_f71b;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2122_c11_725a_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_bb79 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_bb79;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_7743 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_7743;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_5f89 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_5f89;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_2d97 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_2d97;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_925e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_925e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_6e46 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_6e46;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2091_c6_930d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_bb7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2116_DUPLICATE_165f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2116_DUPLICATE_165f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_b31a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_0ead LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_0ead_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_5553] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_left;
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output := BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_608b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2091_l2128_l2116_DUPLICATE_3e91 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2091_l2128_l2116_DUPLICATE_3e91_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l2131_c31_e1c4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_return_output := CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2120_l2116_DUPLICATE_2d8d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2120_l2116_DUPLICATE_2d8d_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_4d0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2121_l2113_l2117_DUPLICATE_a303 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2121_l2113_l2117_DUPLICATE_a303_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_5a16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_left;
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_return_output := BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2120_l2116_DUPLICATE_ce1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2120_l2116_DUPLICATE_ce1a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_5b83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_left;
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output := BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2123_c30_a6f4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_ins;
     sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_x;
     sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_return_output := sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_930d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_b31a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5b83_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_5553_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_4d0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_608b_return_output;
     VAR_MUX_uxn_opcodes_h_l2122_c11_725a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_bb7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_5a16_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2121_l2113_l2117_DUPLICATE_a303_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2121_l2113_l2117_DUPLICATE_a303_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2121_l2113_l2117_DUPLICATE_a303_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2116_DUPLICATE_165f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2116_DUPLICATE_165f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2116_DUPLICATE_165f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2116_DUPLICATE_165f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2116_DUPLICATE_165f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2120_l2116_DUPLICATE_ce1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2120_l2116_DUPLICATE_ce1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2120_l2116_DUPLICATE_ce1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2120_l2116_DUPLICATE_ce1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2120_l2116_DUPLICATE_ce1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2128_l2120_l2116_DUPLICATE_ce1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2120_l2116_DUPLICATE_2d8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2120_l2116_DUPLICATE_2d8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2120_l2116_DUPLICATE_2d8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2120_l2116_DUPLICATE_2d8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2120_l2116_DUPLICATE_2d8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_0ead_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_0ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2091_l2128_l2116_DUPLICATE_3e91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2091_l2128_l2116_DUPLICATE_3e91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2091_l2128_l2116_DUPLICATE_3e91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2091_l2128_l2116_DUPLICATE_3e91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2091_l2128_l2116_DUPLICATE_3e91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2112_l2107_l2104_l2091_l2128_l2116_DUPLICATE_3e91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_8a9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_a6f4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_d8e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_d8e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2131_c21_9f79] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_9f79_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_e1c4_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_0997] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2121_c3_1538] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_left;
     BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_return_output := BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2113_c3_e030] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_left;
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_return_output := BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_d8e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_e030_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_1538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_9f79_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_5d10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output;
     -- t16_MUX[uxn_opcodes_h_l2112_c7_c448] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2112_c7_c448_cond <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_cond;
     t16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue;
     t16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output := t16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_e984] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;

     -- n16_MUX[uxn_opcodes_h_l2120_c7_0997] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2120_c7_0997_cond <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_cond;
     n16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue;
     n16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output := n16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_d8e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_0997] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2122_c26_4315] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_left;
     BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_return_output := BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_0997] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_0997] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2122_c11_725a_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_4315_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_d8e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_e984] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;

     -- t16_MUX[uxn_opcodes_h_l2107_c7_7807] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2107_c7_7807_cond <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_cond;
     t16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue;
     t16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output := t16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_e984] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_e984] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;

     -- n16_MUX[uxn_opcodes_h_l2116_c7_e984] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2116_c7_e984_cond <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_cond;
     n16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue;
     n16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output := n16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_c448] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;

     -- MUX[uxn_opcodes_h_l2122_c11_725a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2122_c11_725a_cond <= VAR_MUX_uxn_opcodes_h_l2122_c11_725a_cond;
     MUX_uxn_opcodes_h_l2122_c11_725a_iftrue <= VAR_MUX_uxn_opcodes_h_l2122_c11_725a_iftrue;
     MUX_uxn_opcodes_h_l2122_c11_725a_iffalse <= VAR_MUX_uxn_opcodes_h_l2122_c11_725a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2122_c11_725a_return_output := MUX_uxn_opcodes_h_l2122_c11_725a_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue := VAR_MUX_uxn_opcodes_h_l2122_c11_725a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;
     -- n16_MUX[uxn_opcodes_h_l2112_c7_c448] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2112_c7_c448_cond <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_cond;
     n16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue;
     n16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output := n16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_c448] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;

     -- t16_MUX[uxn_opcodes_h_l2104_c7_5cc1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond;
     t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue;
     t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output := t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_c448] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c7_7807] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_c448] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2126_c21_94d4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_94d4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2122_c11_725a_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2120_c7_0997] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_cond;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output := tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_94d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;
     -- n16_MUX[uxn_opcodes_h_l2107_c7_7807] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2107_c7_7807_cond <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_cond;
     n16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue;
     n16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output := n16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_7807] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_0997] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_return_output := result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2116_c7_e984] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_cond;
     tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output := tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;

     -- t16_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_7807] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_5cc1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_7807] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_0997_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2112_c7_c448] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_cond;
     tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output := tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2116_c7_e984] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_return_output := result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;

     -- n16_MUX[uxn_opcodes_h_l2104_c7_5cc1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond;
     n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue;
     n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output := n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_5cc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_5cc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_5cc1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_e984_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2107_c7_7807] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_cond;
     tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output := tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;

     -- n16_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2112_c7_c448] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_return_output := result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_c448_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2107_c7_7807] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_return_output := result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2104_c7_5cc1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond;
     tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output := tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_7807_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2104_c7_5cc1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_5cc1_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2091_c2_8a9e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2135_l2087_DUPLICATE_0e99 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2135_l2087_DUPLICATE_0e99_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_8a9e_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2135_l2087_DUPLICATE_0e99_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2135_l2087_DUPLICATE_0e99_return_output;
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
