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
-- Submodules: 67
entity swp2_0CLK_814c2afd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_814c2afd;
architecture arch of swp2_0CLK_814c2afd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2608_c6_16aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2608_c2_d655]
signal t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2608_c2_d655]
signal t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2608_c2_d655]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2608_c2_d655]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2608_c2_d655]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2608_c2_d655]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2608_c2_d655]
signal result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2608_c2_d655]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2608_c2_d655]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2608_c2_d655]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2608_c2_d655]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2608_c2_d655]
signal n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2608_c2_d655]
signal n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2621_c11_f8b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2621_c7_4f4d]
signal t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2621_c7_4f4d]
signal t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2621_c7_4f4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2621_c7_4f4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2621_c7_4f4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2621_c7_4f4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2621_c7_4f4d]
signal result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2621_c7_4f4d]
signal n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2621_c7_4f4d]
signal n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2624_c11_721f]
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2624_c7_27f7]
signal t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2624_c7_27f7]
signal t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2624_c7_27f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2624_c7_27f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2624_c7_27f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2624_c7_27f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2624_c7_27f7]
signal result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2624_c7_27f7]
signal n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2624_c7_27f7]
signal n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2628_c11_1bc0]
signal BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2628_c7_3f12]
signal t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2628_c7_3f12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2628_c7_3f12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2628_c7_3f12]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2628_c7_3f12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2628_c7_3f12]
signal result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2628_c7_3f12]
signal n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2628_c7_3f12]
signal n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2632_c11_ac33]
signal BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2632_c7_8eca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2632_c7_8eca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2632_c7_8eca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2632_c7_8eca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2632_c7_8eca]
signal result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2632_c7_8eca]
signal n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2632_c7_8eca]
signal n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2634_c30_df84]
signal sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2639_c11_ad12]
signal BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2639_c7_6a45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2639_c7_6a45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2639_c7_6a45]
signal result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2639_c7_6a45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2639_c7_6a45]
signal n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2645_c11_52c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2645_c7_054a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2645_c7_054a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2645_c7_054a]
signal result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2649_c11_2059]
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c7_7aa6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c7_7aa6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2649_c7_7aa6]
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa
BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2608_c2_d655
t16_low_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2608_c2_d655
t16_high_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655
result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655
result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655
result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655
result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655
result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2608_c2_d655
n16_low_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2608_c2_d655
n16_high_MUX_uxn_opcodes_h_l2608_c2_d655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond,
n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue,
n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse,
n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d
t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond,
t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue,
t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse,
t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d
t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond,
t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue,
t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse,
t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d
result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d
result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d
n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond,
n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d
n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond,
n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_left,
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_right,
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7
t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond,
t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue,
t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse,
t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7
t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond,
t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue,
t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse,
t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7
result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7
result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7
n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond,
n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue,
n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse,
n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7
n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond,
n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue,
n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse,
n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0
BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_left,
BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_right,
BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12
t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond,
t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue,
t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse,
t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12
result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12
result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12
result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12
result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_cond,
result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12
n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond,
n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue,
n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse,
n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12
n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_cond,
n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue,
n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse,
n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33
BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_left,
BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_right,
BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca
result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca
result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca
result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca
result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_cond,
result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca
n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_cond,
n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue,
n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse,
n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca
n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_cond,
n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue,
n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse,
n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2634_c30_df84
sp_relative_shift_uxn_opcodes_h_l2634_c30_df84 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_ins,
sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_x,
sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_y,
sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_left,
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_right,
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45
result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_cond,
result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45
result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45
n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_cond,
n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue,
n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse,
n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a
result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_left,
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_right,
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6
result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16_high,
 t16_low,
 n16_high,
 n16_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output,
 t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output,
 t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output,
 t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output,
 t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output,
 t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output,
 n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output,
 n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output,
 t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output,
 n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output,
 n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output,
 n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output,
 n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output,
 sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output,
 n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2613_c3_f45f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2618_c3_b0e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2622_c3_d904 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2626_c3_8f6e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2630_c3_9336 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2636_c3_fba6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2642_c3_23fc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2641_c3_0426 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2646_c3_d44e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_8d67 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2649_c7_7aa6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2621_l2649_l2608_l2628_l2624_DUPLICATE_dba2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2628_l2621_l2632_l2624_DUPLICATE_16fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2639_l2628_l2621_l2624_DUPLICATE_3814_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2621_l2649_l2645_l2639_l2632_l2628_l2624_DUPLICATE_405a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2655_l2604_DUPLICATE_515f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_high := t16_high;
  REG_VAR_t16_low := t16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2646_c3_d44e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2646_c3_d44e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_8d67 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_8d67;
     VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2636_c3_fba6 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2636_c3_fba6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2618_c3_b0e8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2618_c3_b0e8;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2641_c3_0426 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2641_c3_0426;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2613_c3_f45f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2613_c3_f45f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2622_c3_d904 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2622_c3_d904;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2626_c3_8f6e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2626_c3_8f6e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2630_c3_9336 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2630_c3_9336;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2642_c3_23fc := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2642_c3_23fc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2649_c11_2059] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_left;
     BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_return_output := BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2621_l2649_l2608_l2628_l2624_DUPLICATE_dba2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2621_l2649_l2608_l2628_l2624_DUPLICATE_dba2_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2621_l2649_l2645_l2639_l2632_l2628_l2624_DUPLICATE_405a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2621_l2649_l2645_l2639_l2632_l2628_l2624_DUPLICATE_405a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2624_c11_721f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2639_c11_ad12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_left;
     BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output := BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2608_c2_d655_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2608_c6_16aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2649_c7_7aa6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2649_c7_7aa6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2632_c11_ac33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_left;
     BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output := BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2628_c11_1bc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2621_c11_f8b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2645_c11_52c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2628_l2621_l2632_l2624_DUPLICATE_16fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2628_l2621_l2632_l2624_DUPLICATE_16fb_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2634_c30_df84] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_ins;
     sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_x;
     sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_return_output := sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2608_c2_d655_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2608_c2_d655_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2639_l2628_l2621_l2624_DUPLICATE_3814 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2639_l2628_l2621_l2624_DUPLICATE_3814_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2608_c2_d655_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c6_16aa_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_f8b3_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_721f_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_1bc0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_ac33_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_ad12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_52c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_2059_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2639_l2628_l2621_l2624_DUPLICATE_3814_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2639_l2628_l2621_l2624_DUPLICATE_3814_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2639_l2628_l2621_l2624_DUPLICATE_3814_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2639_l2628_l2621_l2624_DUPLICATE_3814_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2621_l2649_l2645_l2639_l2632_l2628_l2624_DUPLICATE_405a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2621_l2649_l2645_l2639_l2632_l2628_l2624_DUPLICATE_405a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2621_l2649_l2645_l2639_l2632_l2628_l2624_DUPLICATE_405a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2621_l2649_l2645_l2639_l2632_l2628_l2624_DUPLICATE_405a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2621_l2649_l2645_l2639_l2632_l2628_l2624_DUPLICATE_405a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2621_l2649_l2645_l2639_l2632_l2628_l2624_DUPLICATE_405a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2621_l2649_l2645_l2639_l2632_l2628_l2624_DUPLICATE_405a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2628_l2621_l2632_l2624_DUPLICATE_16fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2628_l2621_l2632_l2624_DUPLICATE_16fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2628_l2621_l2632_l2624_DUPLICATE_16fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2628_l2621_l2632_l2624_DUPLICATE_16fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2621_l2649_l2608_l2628_l2624_DUPLICATE_dba2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2621_l2649_l2608_l2628_l2624_DUPLICATE_dba2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2621_l2649_l2608_l2628_l2624_DUPLICATE_dba2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2621_l2649_l2608_l2628_l2624_DUPLICATE_dba2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2621_l2649_l2608_l2628_l2624_DUPLICATE_dba2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2608_c2_d655_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2608_c2_d655_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2608_c2_d655_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2608_c2_d655_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2649_c7_7aa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2634_c30_df84_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2649_c7_7aa6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2639_c7_6a45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2628_c7_3f12] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond;
     t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output := t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2624_c7_27f7] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond;
     t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output := t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2639_c7_6a45] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_cond;
     n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output := n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c7_7aa6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c7_7aa6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2632_c7_8eca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2632_c7_8eca] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_cond;
     n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output := n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2649_c7_7aa6_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2632_c7_8eca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2621_c7_4f4d] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond;
     t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output := t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2645_c7_054a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2645_c7_054a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2628_c7_3f12] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_cond;
     n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output := n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2624_c7_27f7] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond;
     t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output := t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2645_c7_054a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2628_c7_3f12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2632_c7_8eca] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_cond;
     n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output := n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_054a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_054a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2645_c7_054a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2628_c7_3f12] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_cond;
     n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output := n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2639_c7_6a45] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output := result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2639_c7_6a45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2624_c7_27f7] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_cond;
     n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output := n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2621_c7_4f4d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond;
     t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output := t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2624_c7_27f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2639_c7_6a45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2628_c7_3f12] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_6a45_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2632_c7_8eca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output := result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2632_c7_8eca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2621_c7_4f4d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond;
     n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output := n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2624_c7_27f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2632_c7_8eca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2621_c7_4f4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2624_c7_27f7] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_cond;
     n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output := n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2632_c7_8eca_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2628_c7_3f12] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output := result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2621_c7_4f4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2628_c7_3f12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2628_c7_3f12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2621_c7_4f4d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond;
     n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output := n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2628_c7_3f12_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2624_c7_27f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2624_c7_27f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2624_c7_27f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2624_c7_27f7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2621_c7_4f4d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2621_c7_4f4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2621_c7_4f4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2621_c7_4f4d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2608_c2_d655] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_return_output := result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2655_l2604_DUPLICATE_515f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2655_l2604_DUPLICATE_515f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2608_c2_d655_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c2_d655_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2655_l2604_DUPLICATE_515f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2655_l2604_DUPLICATE_515f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16_high <= REG_COMB_t16_high;
     t16_low <= REG_COMB_t16_low;
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
