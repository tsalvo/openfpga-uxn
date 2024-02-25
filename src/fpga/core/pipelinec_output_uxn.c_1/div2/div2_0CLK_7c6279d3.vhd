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
-- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_fb92]
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal t16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2090_c2_8bad]
signal n16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_ae53]
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2103_c7_497e]
signal t16_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2103_c7_497e]
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_497e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_497e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_497e]
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_497e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_497e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2103_c7_497e]
signal n16_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_605c]
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2106_c7_01a7]
signal t16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2106_c7_01a7]
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_01a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_01a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_01a7]
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_01a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_01a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2106_c7_01a7]
signal n16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_0eac]
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2111_c7_7593]
signal t16_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2111_c7_7593]
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_7593]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_7593]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_7593]
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_7593]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_7593]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2111_c7_7593]
signal n16_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2112_c3_a20b]
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_1db2]
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2115_c7_89b0]
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_89b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_89b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_89b0]
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_89b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_89b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2115_c7_89b0]
signal n16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_5e83]
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2119_c7_4cdc]
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_4cdc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_4cdc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_4cdc]
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_4cdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_4cdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2119_c7_4cdc]
signal n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2120_c3_211c]
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_394b]
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_7b42]
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2121_c11_803c]
signal MUX_uxn_opcodes_h_l2121_c11_803c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_803c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_803c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_803c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2122_c30_036d]
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_0bce]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_557e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_557e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_557e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_557e]
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2130_c31_22cd]
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_left,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_right,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output);

-- t16_MUX_uxn_opcodes_h_l2090_c2_8bad
t16_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
t16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad
tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- n16_MUX_uxn_opcodes_h_l2090_c2_8bad
n16_MUX_uxn_opcodes_h_l2090_c2_8bad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond,
n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue,
n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse,
n16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_left,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_right,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output);

-- t16_MUX_uxn_opcodes_h_l2103_c7_497e
t16_MUX_uxn_opcodes_h_l2103_c7_497e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2103_c7_497e_cond,
t16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue,
t16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse,
t16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2103_c7_497e
tmp16_MUX_uxn_opcodes_h_l2103_c7_497e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_cond,
tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_return_output);

-- n16_MUX_uxn_opcodes_h_l2103_c7_497e
n16_MUX_uxn_opcodes_h_l2103_c7_497e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2103_c7_497e_cond,
n16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue,
n16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse,
n16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_left,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_right,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output);

-- t16_MUX_uxn_opcodes_h_l2106_c7_01a7
t16_MUX_uxn_opcodes_h_l2106_c7_01a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond,
t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue,
t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse,
t16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7
tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond,
tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output);

-- n16_MUX_uxn_opcodes_h_l2106_c7_01a7
n16_MUX_uxn_opcodes_h_l2106_c7_01a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond,
n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue,
n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse,
n16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_left,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_right,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output);

-- t16_MUX_uxn_opcodes_h_l2111_c7_7593
t16_MUX_uxn_opcodes_h_l2111_c7_7593 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2111_c7_7593_cond,
t16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue,
t16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse,
t16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2111_c7_7593
tmp16_MUX_uxn_opcodes_h_l2111_c7_7593 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_cond,
tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue,
tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse,
tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_cond,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_return_output);

-- n16_MUX_uxn_opcodes_h_l2111_c7_7593
n16_MUX_uxn_opcodes_h_l2111_c7_7593 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2111_c7_7593_cond,
n16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue,
n16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse,
n16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b
BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_left,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_right,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_left,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_right,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0
tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond,
tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output);

-- n16_MUX_uxn_opcodes_h_l2115_c7_89b0
n16_MUX_uxn_opcodes_h_l2115_c7_89b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond,
n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue,
n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse,
n16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_left,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_right,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc
tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond,
tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output);

-- n16_MUX_uxn_opcodes_h_l2119_c7_4cdc
n16_MUX_uxn_opcodes_h_l2119_c7_4cdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond,
n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue,
n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse,
n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c
BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_left,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_right,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_left,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_right,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_ccb8c834 port map (
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_left,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_right,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_return_output);

-- MUX_uxn_opcodes_h_l2121_c11_803c
MUX_uxn_opcodes_h_l2121_c11_803c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2121_c11_803c_cond,
MUX_uxn_opcodes_h_l2121_c11_803c_iftrue,
MUX_uxn_opcodes_h_l2121_c11_803c_iffalse,
MUX_uxn_opcodes_h_l2121_c11_803c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2122_c30_036d
sp_relative_shift_uxn_opcodes_h_l2122_c30_036d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_ins,
sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_x,
sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_y,
sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd
CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_x,
CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output,
 t16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 n16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output,
 t16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_return_output,
 n16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output,
 t16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output,
 n16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output,
 t16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output,
 tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_return_output,
 n16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output,
 n16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output,
 tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output,
 n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_return_output,
 MUX_uxn_opcodes_h_l2121_c11_803c_return_output,
 sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_a8a3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_aaf8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_5b89 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_1354 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_ed51 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_4ef0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_803c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_803c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_803c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_803c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_d2ad_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_2805 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_24ff : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_868d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_d0a5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_0e92_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_f38e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_e36f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_1ae2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_0e85_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2134_l2086_DUPLICATE_adc0_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_ed51 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_ed51;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_4ef0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_4ef0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_5b89 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_5b89;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_aaf8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_aaf8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_24ff := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_24ff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_1354 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_1354;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2121_c11_803c_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_a8a3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_a8a3;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_2805 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_2805;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse := tmp16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2122_c30_036d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_ins;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_x;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_return_output := sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_605c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_1db2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_394b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_f38e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_f38e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_0e92 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_0e92_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_fb92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_left;
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output := BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_0bce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_ae53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_e36f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_e36f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_5e83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_left;
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output := BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2130_c31_22cd] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_return_output := CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_0eac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_1ae2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_1ae2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_0e85 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_0e85_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_d0a5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_d0a5_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_fb92_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ae53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_605c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_0eac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_1db2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_5e83_return_output;
     VAR_MUX_uxn_opcodes_h_l2121_c11_803c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_394b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0bce_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_1ae2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_1ae2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_1ae2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_f38e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_f38e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_f38e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_f38e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_f38e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_e36f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_e36f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_e36f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_e36f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_e36f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_e36f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_0e92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_0e92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_0e92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_0e92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_0e92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_0e85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_0e85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_d0a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_d0a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_d0a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_d0a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_d0a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_d0a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_8bad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_036d_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2112_c3_a20b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_left;
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_return_output := BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_4cdc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_557e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_557e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2120_c3_211c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_left;
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_return_output := BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_557e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2130_c21_868d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_868d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_22cd_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_a20b_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_211c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_868d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_1977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_557e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_557e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_557e_return_output;
     -- t16_MUX[uxn_opcodes_h_l2111_c7_7593] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2111_c7_7593_cond <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_cond;
     t16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue;
     t16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output := t16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;

     -- n16_MUX[uxn_opcodes_h_l2119_c7_4cdc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond;
     n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue;
     n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output := n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_7b42] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_left;
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_return_output := BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_557e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_4cdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_89b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_4cdc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_4cdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2121_c11_803c_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_7b42_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_557e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_7593] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;

     -- n16_MUX[uxn_opcodes_h_l2115_c7_89b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond;
     n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue;
     n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output := n16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_89b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2106_c7_01a7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond;
     t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue;
     t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output := t16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_89b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;

     -- MUX[uxn_opcodes_h_l2121_c11_803c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2121_c11_803c_cond <= VAR_MUX_uxn_opcodes_h_l2121_c11_803c_cond;
     MUX_uxn_opcodes_h_l2121_c11_803c_iftrue <= VAR_MUX_uxn_opcodes_h_l2121_c11_803c_iftrue;
     MUX_uxn_opcodes_h_l2121_c11_803c_iffalse <= VAR_MUX_uxn_opcodes_h_l2121_c11_803c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2121_c11_803c_return_output := MUX_uxn_opcodes_h_l2121_c11_803c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_89b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue := VAR_MUX_uxn_opcodes_h_l2121_c11_803c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_7593] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_01a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_7593] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;

     -- t16_MUX[uxn_opcodes_h_l2103_c7_497e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2103_c7_497e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_cond;
     t16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue;
     t16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output := t16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2119_c7_4cdc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output := tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_7593] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;

     -- n16_MUX[uxn_opcodes_h_l2111_c7_7593] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2111_c7_7593_cond <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_cond;
     n16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue;
     n16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output := n16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2125_c21_d2ad] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_d2ad_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2121_c11_803c_return_output);

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_d2ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_497e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2115_c7_89b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_cond;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output := tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_01a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_4cdc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := t16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_01a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_01a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2106_c7_01a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond;
     n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue;
     n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output := n16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_4cdc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2111_c7_7593] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_cond;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output := tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_497e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_497e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_497e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2103_c7_497e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2103_c7_497e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_cond;
     n16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue;
     n16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output := n16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_89b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_89b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;
     -- n16_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := n16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2106_c7_01a7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_cond;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output := tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_7593] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_return_output := result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_7593_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_01a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2103_c7_497e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_cond;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output := tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_01a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_497e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_497e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_8bad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output := result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2134_l2086_DUPLICATE_adc0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2134_l2086_DUPLICATE_adc0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_8bad_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2134_l2086_DUPLICATE_adc0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2134_l2086_DUPLICATE_adc0_return_output;
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
