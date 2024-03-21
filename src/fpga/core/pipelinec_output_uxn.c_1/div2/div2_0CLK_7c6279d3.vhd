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
-- BIN_OP_EQ[uxn_opcodes_h_l2091_c6_6885]
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2091_c2_cdb4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_d5f1]
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2104_c7_cead]
signal n16_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2104_c7_cead]
signal t16_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2104_c7_cead]
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_cead]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_cead]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_cead]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2104_c7_cead]
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_cead]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_fa7f]
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2107_c7_fab8]
signal n16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2107_c7_fab8]
signal t16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2107_c7_fab8]
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_fab8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_fab8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_fab8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2107_c7_fab8]
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c7_fab8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_ca5d]
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2112_c7_5a09]
signal n16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2112_c7_5a09]
signal t16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2112_c7_5a09]
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_5a09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_5a09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_5a09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2112_c7_5a09]
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_5a09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2113_c3_afd3]
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_eb2f]
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2116_c7_a334]
signal n16_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2116_c7_a334]
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_a334]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_a334]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_a334]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2116_c7_a334]
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_a334]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_7e38]
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2120_c7_1834]
signal n16_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2120_c7_1834]
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_1834]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_1834]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_1834]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_1834]
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_1834]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2121_c3_5fa3]
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_e314]
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2122_c26_d362]
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2122_c11_8ace]
signal MUX_uxn_opcodes_h_l2122_c11_8ace_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_8ace_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_8ace_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_8ace_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2123_c30_adf5]
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_f397]
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_617e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_617e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_617e]
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_617e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2131_c31_615a]
signal CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_left,
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_right,
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output);

-- n16_MUX_uxn_opcodes_h_l2091_c2_cdb4
n16_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- t16_MUX_uxn_opcodes_h_l2091_c2_cdb4
t16_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4
tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_left,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_right,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output);

-- n16_MUX_uxn_opcodes_h_l2104_c7_cead
n16_MUX_uxn_opcodes_h_l2104_c7_cead : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2104_c7_cead_cond,
n16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue,
n16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse,
n16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output);

-- t16_MUX_uxn_opcodes_h_l2104_c7_cead
t16_MUX_uxn_opcodes_h_l2104_c7_cead : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2104_c7_cead_cond,
t16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue,
t16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse,
t16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2104_c7_cead
tmp16_MUX_uxn_opcodes_h_l2104_c7_cead : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_cond,
tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue,
tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse,
tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_cond,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_left,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_right,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output);

-- n16_MUX_uxn_opcodes_h_l2107_c7_fab8
n16_MUX_uxn_opcodes_h_l2107_c7_fab8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond,
n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue,
n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse,
n16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output);

-- t16_MUX_uxn_opcodes_h_l2107_c7_fab8
t16_MUX_uxn_opcodes_h_l2107_c7_fab8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond,
t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue,
t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse,
t16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8
tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond,
tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_left,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_right,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output);

-- n16_MUX_uxn_opcodes_h_l2112_c7_5a09
n16_MUX_uxn_opcodes_h_l2112_c7_5a09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond,
n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue,
n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse,
n16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output);

-- t16_MUX_uxn_opcodes_h_l2112_c7_5a09
t16_MUX_uxn_opcodes_h_l2112_c7_5a09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond,
t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue,
t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse,
t16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09
tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond,
tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue,
tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse,
tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_cond,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3
BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_left,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_right,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_left,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_right,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output);

-- n16_MUX_uxn_opcodes_h_l2116_c7_a334
n16_MUX_uxn_opcodes_h_l2116_c7_a334 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2116_c7_a334_cond,
n16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue,
n16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse,
n16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2116_c7_a334
tmp16_MUX_uxn_opcodes_h_l2116_c7_a334 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_cond,
tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue,
tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse,
tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_cond,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_left,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_right,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output);

-- n16_MUX_uxn_opcodes_h_l2120_c7_1834
n16_MUX_uxn_opcodes_h_l2120_c7_1834 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2120_c7_1834_cond,
n16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue,
n16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse,
n16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2120_c7_1834
tmp16_MUX_uxn_opcodes_h_l2120_c7_1834 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_cond,
tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue,
tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse,
tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_cond,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3
BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_left,
BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_right,
BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_left,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_right,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_ccb8c834 port map (
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_left,
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_right,
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_return_output);

-- MUX_uxn_opcodes_h_l2122_c11_8ace
MUX_uxn_opcodes_h_l2122_c11_8ace : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2122_c11_8ace_cond,
MUX_uxn_opcodes_h_l2122_c11_8ace_iftrue,
MUX_uxn_opcodes_h_l2122_c11_8ace_iffalse,
MUX_uxn_opcodes_h_l2122_c11_8ace_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5
sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_ins,
sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_x,
sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_y,
sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_left,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_right,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2131_c31_615a
CONST_SR_8_uxn_opcodes_h_l2131_c31_615a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_x,
CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d
CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output,
 n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output,
 n16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output,
 t16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output,
 tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output,
 n16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output,
 t16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output,
 n16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output,
 t16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output,
 tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output,
 n16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output,
 tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output,
 n16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output,
 tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_return_output,
 MUX_uxn_opcodes_h_l2122_c11_8ace_return_output,
 sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_1e2b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_3995 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_373f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_8bd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_c8b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_7d6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_ae91_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_1f3a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_c40a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_0016_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2091_l2128_DUPLICATE_ccb4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2128_DUPLICATE_09c5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_l2128_DUPLICATE_e99b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_9297_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2117_l2113_l2121_DUPLICATE_e050_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2128_DUPLICATE_f27c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2087_l2135_DUPLICATE_aa49_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_1f3a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_1f3a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_3995 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_3995;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_c40a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_c40a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_1e2b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_1e2b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_373f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_373f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_c8b1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_c8b1;
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_8bd2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_8bd2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_7d6d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_7d6d;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_ca5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2123_c30_adf5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_ins;
     sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_x;
     sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_return_output := sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2131_c31_615a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_return_output := CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_l2128_DUPLICATE_e99b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_l2128_DUPLICATE_e99b_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_d5f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_e314] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_left;
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_return_output := BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_fa7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_9297 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_9297_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2128_DUPLICATE_09c5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2128_DUPLICATE_09c5_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2117_l2113_l2121_DUPLICATE_e050 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2117_l2113_l2121_DUPLICATE_e050_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_f397] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_left;
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_return_output := BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2091_c6_6885] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_left;
     BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output := BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_7e38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_left;
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output := BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2091_l2128_DUPLICATE_ccb4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2091_l2128_DUPLICATE_ccb4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_eb2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2128_DUPLICATE_f27c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2128_DUPLICATE_f27c_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_6885_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_d5f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_fa7f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_ca5d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_eb2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_7e38_return_output;
     VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_e314_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_f397_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2117_l2113_l2121_DUPLICATE_e050_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2117_l2113_l2121_DUPLICATE_e050_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2117_l2113_l2121_DUPLICATE_e050_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2128_DUPLICATE_09c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2128_DUPLICATE_09c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2128_DUPLICATE_09c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2128_DUPLICATE_09c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2128_DUPLICATE_09c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_l2128_DUPLICATE_e99b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_l2128_DUPLICATE_e99b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_l2128_DUPLICATE_e99b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_l2128_DUPLICATE_e99b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_l2128_DUPLICATE_e99b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_l2128_DUPLICATE_e99b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_9297_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_9297_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_9297_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_9297_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2120_l2116_l2112_l2107_l2104_DUPLICATE_9297_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2128_DUPLICATE_f27c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2128_DUPLICATE_f27c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2091_l2128_DUPLICATE_ccb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2091_l2128_DUPLICATE_ccb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2091_l2128_DUPLICATE_ccb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2091_l2128_DUPLICATE_ccb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2091_l2128_DUPLICATE_ccb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2116_l2112_l2107_l2104_l2091_l2128_DUPLICATE_ccb4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_cdb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_adf5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_1834] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_617e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_617e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2121_c3_5fa3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_left;
     BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_return_output := BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_617e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2113_c3_afd3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_left;
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_return_output := BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2131_c21_0016] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_0016_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_615a_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_afd3_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_5fa3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_0016_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2118_l2109_DUPLICATE_6a0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_617e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_617e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_617e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_1834] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_a334] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_1834] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_617e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2112_c7_5a09] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond;
     t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue;
     t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output := t16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_1834] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;

     -- n16_MUX[uxn_opcodes_h_l2120_c7_1834] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2120_c7_1834_cond <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_cond;
     n16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue;
     n16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output := n16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2122_c26_d362] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_left;
     BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_return_output := BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_d362_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_617e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;
     -- MUX[uxn_opcodes_h_l2122_c11_8ace] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2122_c11_8ace_cond <= VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_cond;
     MUX_uxn_opcodes_h_l2122_c11_8ace_iftrue <= VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_iftrue;
     MUX_uxn_opcodes_h_l2122_c11_8ace_iffalse <= VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_return_output := MUX_uxn_opcodes_h_l2122_c11_8ace_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_5a09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_a334] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;

     -- n16_MUX[uxn_opcodes_h_l2116_c7_a334] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2116_c7_a334_cond <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_cond;
     n16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue;
     n16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output := n16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_a334] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;

     -- t16_MUX[uxn_opcodes_h_l2107_c7_fab8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond;
     t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue;
     t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output := t16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_a334] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue := VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;
     -- n16_MUX[uxn_opcodes_h_l2112_c7_5a09] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond;
     n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue;
     n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output := n16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2120_c7_1834] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_cond;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output := tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c7_fab8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2104_c7_cead] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2104_c7_cead_cond <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_cond;
     t16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue;
     t16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output := t16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2126_c21_ae91] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_ae91_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2122_c11_8ace_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_5a09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_5a09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_5a09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_ae91_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_fab8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_fab8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_fab8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_1834] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_return_output := result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;

     -- t16_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2107_c7_fab8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond;
     n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue;
     n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output := n16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2116_c7_a334] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_cond;
     tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output := tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_cead] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_1834_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_cead] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2116_c7_a334] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_return_output := result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2104_c7_cead] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2104_c7_cead_cond <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_cond;
     n16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue;
     n16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output := n16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_cead] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2112_c7_5a09] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_cond;
     tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output := tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_cead] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_a334_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2107_c7_fab8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_cond;
     tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output := tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2112_c7_5a09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output := result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_5a09_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2107_c7_fab8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2104_c7_cead] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_cond;
     tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output := tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_fab8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2104_c7_cead] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_return_output := result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_cead_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2091_c2_cdb4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2087_l2135_DUPLICATE_aa49 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2087_l2135_DUPLICATE_aa49_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_cdb4_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2087_l2135_DUPLICATE_aa49_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2087_l2135_DUPLICATE_aa49_return_output;
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
