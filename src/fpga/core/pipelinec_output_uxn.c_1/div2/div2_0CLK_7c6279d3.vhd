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
-- BIN_OP_EQ[uxn_opcodes_h_l2091_c6_fbbe]
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2091_c2_9821]
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2091_c2_9821]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2091_c2_9821]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2091_c2_9821]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2091_c2_9821]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2091_c2_9821]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2091_c2_9821]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2091_c2_9821]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2091_c2_9821]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2091_c2_9821]
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2091_c2_9821]
signal n16_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2091_c2_9821]
signal t16_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_43ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2104_c7_aab8]
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_aab8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_aab8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_aab8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_aab8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2104_c7_aab8]
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2104_c7_aab8]
signal n16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2104_c7_aab8]
signal t16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_091e]
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2107_c7_bc32]
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c7_bc32]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_bc32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_bc32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_bc32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2107_c7_bc32]
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2107_c7_bc32]
signal n16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2107_c7_bc32]
signal t16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_8c4a]
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2112_c7_04aa]
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_04aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_04aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_04aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_04aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2112_c7_04aa]
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2112_c7_04aa]
signal n16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2112_c7_04aa]
signal t16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2113_c3_7d26]
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_7d27]
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2116_c7_759e]
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_759e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_759e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_759e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_759e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2116_c7_759e]
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2116_c7_759e]
signal n16_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_b236]
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_4825]
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_4825]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_4825]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_4825]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_4825]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2120_c7_4825]
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2120_c7_4825]
signal n16_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2121_c3_6077]
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_8ce9]
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2122_c26_3f47]
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2122_c11_7c45]
signal MUX_uxn_opcodes_h_l2122_c11_7c45_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_7c45_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_7c45_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2122_c11_7c45_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2123_c30_fe4b]
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_040c]
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_95d2]
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_95d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_95d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_95d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2131_c31_f877]
signal CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_left,
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_right,
BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2091_c2_9821
tmp16_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- n16_MUX_uxn_opcodes_h_l2091_c2_9821
n16_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
n16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
n16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
n16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- t16_MUX_uxn_opcodes_h_l2091_c2_9821
t16_MUX_uxn_opcodes_h_l2091_c2_9821 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2091_c2_9821_cond,
t16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue,
t16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse,
t16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8
tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond,
tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output);

-- n16_MUX_uxn_opcodes_h_l2104_c7_aab8
n16_MUX_uxn_opcodes_h_l2104_c7_aab8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond,
n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue,
n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse,
n16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output);

-- t16_MUX_uxn_opcodes_h_l2104_c7_aab8
t16_MUX_uxn_opcodes_h_l2104_c7_aab8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond,
t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue,
t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse,
t16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_left,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_right,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_cond,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32
tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond,
tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue,
tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse,
tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output);

-- n16_MUX_uxn_opcodes_h_l2107_c7_bc32
n16_MUX_uxn_opcodes_h_l2107_c7_bc32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond,
n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue,
n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse,
n16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output);

-- t16_MUX_uxn_opcodes_h_l2107_c7_bc32
t16_MUX_uxn_opcodes_h_l2107_c7_bc32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond,
t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue,
t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse,
t16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_left,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_right,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa
tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond,
tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue,
tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse,
tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output);

-- n16_MUX_uxn_opcodes_h_l2112_c7_04aa
n16_MUX_uxn_opcodes_h_l2112_c7_04aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond,
n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue,
n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse,
n16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output);

-- t16_MUX_uxn_opcodes_h_l2112_c7_04aa
t16_MUX_uxn_opcodes_h_l2112_c7_04aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond,
t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue,
t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse,
t16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26
BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_left,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_right,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_left,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_right,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2116_c7_759e
tmp16_MUX_uxn_opcodes_h_l2116_c7_759e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_cond,
tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output);

-- n16_MUX_uxn_opcodes_h_l2116_c7_759e
n16_MUX_uxn_opcodes_h_l2116_c7_759e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2116_c7_759e_cond,
n16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue,
n16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse,
n16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_left,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_right,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_cond,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2120_c7_4825
tmp16_MUX_uxn_opcodes_h_l2120_c7_4825 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_cond,
tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue,
tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse,
tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output);

-- n16_MUX_uxn_opcodes_h_l2120_c7_4825
n16_MUX_uxn_opcodes_h_l2120_c7_4825 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2120_c7_4825_cond,
n16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue,
n16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse,
n16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077
BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_left,
BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_right,
BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_left,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_right,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_ccb8c834 port map (
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_left,
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_right,
BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_return_output);

-- MUX_uxn_opcodes_h_l2122_c11_7c45
MUX_uxn_opcodes_h_l2122_c11_7c45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2122_c11_7c45_cond,
MUX_uxn_opcodes_h_l2122_c11_7c45_iftrue,
MUX_uxn_opcodes_h_l2122_c11_7c45_iffalse,
MUX_uxn_opcodes_h_l2122_c11_7c45_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b
sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_ins,
sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_x,
sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_y,
sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_left,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_right,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2131_c31_f877
CONST_SR_8_uxn_opcodes_h_l2131_c31_f877 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_x,
CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e
CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 n16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 t16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output,
 n16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output,
 t16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output,
 tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output,
 n16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output,
 t16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output,
 tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output,
 n16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output,
 t16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output,
 n16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_return_output,
 tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output,
 n16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_return_output,
 MUX_uxn_opcodes_h_l2122_c11_7c45_return_output,
 sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output,
 CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_879e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_128a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_29d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_b223 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_2730 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_a893 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_7205_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_fad7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_1918 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_c8f3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2104_l2091_l2128_l2116_l2112_l2107_DUPLICATE_e347_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2120_l2116_l2112_l2107_DUPLICATE_8881_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2128_l2116_l2112_l2107_DUPLICATE_669a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2128_l2120_l2116_l2112_l2107_DUPLICATE_563e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2113_l2121_l2117_DUPLICATE_97be_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_4d68_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2135_l2087_DUPLICATE_32c7_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_b223 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_b223;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_29d0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_29d0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_1918 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_1918;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_a893 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_a893;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_128a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2096_c3_128a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_879e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_879e;
     VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_2730 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_2730;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_fad7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2129_c3_fad7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_b236] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_left;
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output := BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2120_l2116_l2112_l2107_DUPLICATE_8881 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2120_l2116_l2112_l2107_DUPLICATE_8881_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_43ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_8ce9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_8c4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_4d68 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_4d68_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_040c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2123_c30_fe4b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_ins;
     sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_x;
     sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_return_output := sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2128_l2120_l2116_l2112_l2107_DUPLICATE_563e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2128_l2120_l2116_l2112_l2107_DUPLICATE_563e_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_9821_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_9821_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_7d27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_left;
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output := BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2131_c31_f877] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_return_output := CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2113_l2121_l2117_DUPLICATE_97be LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2113_l2121_l2117_DUPLICATE_97be_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_091e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2104_l2091_l2128_l2116_l2112_l2107_DUPLICATE_e347 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2104_l2091_l2128_l2116_l2112_l2107_DUPLICATE_e347_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2091_c6_fbbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2128_l2116_l2112_l2107_DUPLICATE_669a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2128_l2116_l2112_l2107_DUPLICATE_669a_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_9821_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_9821_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2091_c6_fbbe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_43ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_091e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_8c4a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_7d27_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_b236_return_output;
     VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_8ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_040c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2113_l2121_l2117_DUPLICATE_97be_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2113_l2121_l2117_DUPLICATE_97be_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2108_l2113_l2121_l2117_DUPLICATE_97be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2128_l2116_l2112_l2107_DUPLICATE_669a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2128_l2116_l2112_l2107_DUPLICATE_669a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2128_l2116_l2112_l2107_DUPLICATE_669a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2128_l2116_l2112_l2107_DUPLICATE_669a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2128_l2116_l2112_l2107_DUPLICATE_669a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2128_l2120_l2116_l2112_l2107_DUPLICATE_563e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2128_l2120_l2116_l2112_l2107_DUPLICATE_563e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2128_l2120_l2116_l2112_l2107_DUPLICATE_563e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2128_l2120_l2116_l2112_l2107_DUPLICATE_563e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2128_l2120_l2116_l2112_l2107_DUPLICATE_563e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2128_l2120_l2116_l2112_l2107_DUPLICATE_563e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2120_l2116_l2112_l2107_DUPLICATE_8881_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2120_l2116_l2112_l2107_DUPLICATE_8881_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2120_l2116_l2112_l2107_DUPLICATE_8881_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2120_l2116_l2112_l2107_DUPLICATE_8881_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2120_l2116_l2112_l2107_DUPLICATE_8881_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_4d68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2128_l2116_DUPLICATE_4d68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2104_l2091_l2128_l2116_l2112_l2107_DUPLICATE_e347_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2104_l2091_l2128_l2116_l2112_l2107_DUPLICATE_e347_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2104_l2091_l2128_l2116_l2112_l2107_DUPLICATE_e347_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2104_l2091_l2128_l2116_l2112_l2107_DUPLICATE_e347_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2104_l2091_l2128_l2116_l2112_l2107_DUPLICATE_e347_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2104_l2091_l2128_l2116_l2112_l2107_DUPLICATE_e347_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2091_c2_9821_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2091_c2_9821_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2091_c2_9821_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2091_c2_9821_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2123_c30_fe4b_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_95d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_95d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2113_c3_7d26] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_left;
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_return_output := BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2121_c3_6077] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_left;
     BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_return_output := BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2131_c21_c8f3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_c8f3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2131_c31_f877_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_4825] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_95d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_7d26_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2121_c3_6077_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2131_c21_c8f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2109_l2118_DUPLICATE_7d6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output;
     -- BIN_OP_DIV[uxn_opcodes_h_l2122_c26_3f47] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_left;
     BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_return_output := BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_4825] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_95d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2120_c7_4825] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2120_c7_4825_cond <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_cond;
     n16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue;
     n16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output := n16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_759e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2112_c7_04aa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond;
     t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue;
     t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output := t16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_4825] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_4825] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2122_c26_3f47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_95d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_759e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_759e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_759e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2116_c7_759e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2116_c7_759e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_cond;
     n16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue;
     n16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output := n16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_04aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;

     -- t16_MUX[uxn_opcodes_h_l2107_c7_bc32] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond;
     t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue;
     t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output := t16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;

     -- MUX[uxn_opcodes_h_l2122_c11_7c45] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2122_c11_7c45_cond <= VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_cond;
     MUX_uxn_opcodes_h_l2122_c11_7c45_iftrue <= VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_iftrue;
     MUX_uxn_opcodes_h_l2122_c11_7c45_iffalse <= VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_return_output := MUX_uxn_opcodes_h_l2122_c11_7c45_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue := VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2120_c7_4825] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_cond;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output := tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2126_c21_7205] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_7205_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2122_c11_7c45_return_output);

     -- t16_MUX[uxn_opcodes_h_l2104_c7_aab8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond;
     t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue;
     t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output := t16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c7_bc32] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_04aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2112_c7_04aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond;
     n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue;
     n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output := n16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_04aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_04aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2126_c21_7205_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2116_c7_759e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_cond;
     tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output := tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_bc32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_bc32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_bc32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_aab8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2107_c7_bc32] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond;
     n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue;
     n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output := n16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;

     -- t16_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     t16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     t16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := t16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_4825] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_return_output := result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4825_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;
     -- n16_MUX[uxn_opcodes_h_l2104_c7_aab8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond;
     n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue;
     n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output := n16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2112_c7_04aa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_cond;
     tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output := tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2116_c7_759e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_aab8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_aab8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_aab8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_759e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2112_c7_04aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2107_c7_bc32] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_cond;
     tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output := tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- n16_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     n16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     n16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := n16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2112_c7_04aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2104_c7_aab8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_cond;
     tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output := tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2107_c7_bc32] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output := result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c7_bc32_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2104_c7_aab8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2104_c7_aab8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2091_c2_9821] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_return_output := result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2135_l2087_DUPLICATE_32c7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2135_l2087_DUPLICATE_32c7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2091_c2_9821_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2091_c2_9821_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2135_l2087_DUPLICATE_32c7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2135_l2087_DUPLICATE_32c7_return_output;
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
