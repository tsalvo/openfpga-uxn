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
entity add2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_50b92fe2;
architecture arch of add2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l853_c6_bf76]
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l853_c2_48a9]
signal t16_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l853_c2_48a9]
signal tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l853_c2_48a9]
signal n16_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_48a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_48a9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_48a9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_48a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_48a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_48a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_48a9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_48a9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l853_c2_48a9]
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l866_c11_a728]
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l866_c7_ee62]
signal t16_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l866_c7_ee62]
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l866_c7_ee62]
signal n16_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_ee62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_ee62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l866_c7_ee62]
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_ee62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_ee62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l869_c11_bf03]
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l869_c7_a7e2]
signal t16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l869_c7_a7e2]
signal tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l869_c7_a7e2]
signal n16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_a7e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_a7e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l869_c7_a7e2]
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_a7e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_a7e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l874_c11_e80a]
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l874_c7_a951]
signal t16_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l874_c7_a951]
signal tmp16_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l874_c7_a951]
signal n16_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_a951]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_a951]
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l874_c7_a951]
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_a951]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_a951]
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l875_c3_c553]
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l878_c11_0640]
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l878_c7_7e10]
signal tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l878_c7_7e10]
signal n16_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_7e10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_7e10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l878_c7_7e10]
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_7e10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_7e10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_0ea4]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l882_c7_08c6]
signal tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l882_c7_08c6]
signal n16_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_08c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_08c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l882_c7_08c6]
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_08c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_08c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l883_c3_fe88]
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_b079]
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l885_c30_8113]
signal sp_relative_shift_uxn_opcodes_h_l885_c30_8113_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_8113_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_8113_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_8113_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l890_c11_d862]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l890_c7_be83]
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_be83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_be83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_be83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l893_c31_af62]
signal CONST_SR_8_uxn_opcodes_h_l893_c31_af62_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l893_c31_af62_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76
BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_left,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_right,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output);

-- t16_MUX_uxn_opcodes_h_l853_c2_48a9
t16_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
t16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
t16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
t16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l853_c2_48a9
tmp16_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- n16_MUX_uxn_opcodes_h_l853_c2_48a9
n16_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
n16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
n16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
n16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9
result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728
BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_left,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_right,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output);

-- t16_MUX_uxn_opcodes_h_l866_c7_ee62
t16_MUX_uxn_opcodes_h_l866_c7_ee62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l866_c7_ee62_cond,
t16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue,
t16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse,
t16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output);

-- tmp16_MUX_uxn_opcodes_h_l866_c7_ee62
tmp16_MUX_uxn_opcodes_h_l866_c7_ee62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_cond,
tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue,
tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse,
tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output);

-- n16_MUX_uxn_opcodes_h_l866_c7_ee62
n16_MUX_uxn_opcodes_h_l866_c7_ee62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l866_c7_ee62_cond,
n16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue,
n16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse,
n16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_cond,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03
BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_left,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_right,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output);

-- t16_MUX_uxn_opcodes_h_l869_c7_a7e2
t16_MUX_uxn_opcodes_h_l869_c7_a7e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond,
t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue,
t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse,
t16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2
tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond,
tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output);

-- n16_MUX_uxn_opcodes_h_l869_c7_a7e2
n16_MUX_uxn_opcodes_h_l869_c7_a7e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond,
n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue,
n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse,
n16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2
result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a
BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_left,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_right,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output);

-- t16_MUX_uxn_opcodes_h_l874_c7_a951
t16_MUX_uxn_opcodes_h_l874_c7_a951 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l874_c7_a951_cond,
t16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue,
t16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse,
t16_MUX_uxn_opcodes_h_l874_c7_a951_return_output);

-- tmp16_MUX_uxn_opcodes_h_l874_c7_a951
tmp16_MUX_uxn_opcodes_h_l874_c7_a951 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l874_c7_a951_cond,
tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue,
tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse,
tmp16_MUX_uxn_opcodes_h_l874_c7_a951_return_output);

-- n16_MUX_uxn_opcodes_h_l874_c7_a951
n16_MUX_uxn_opcodes_h_l874_c7_a951 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l874_c7_a951_cond,
n16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue,
n16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse,
n16_MUX_uxn_opcodes_h_l874_c7_a951_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951
result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_cond,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l875_c3_c553
BIN_OP_OR_uxn_opcodes_h_l875_c3_c553 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_left,
BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_right,
BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640
BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_left,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_right,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output);

-- tmp16_MUX_uxn_opcodes_h_l878_c7_7e10
tmp16_MUX_uxn_opcodes_h_l878_c7_7e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_cond,
tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue,
tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse,
tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output);

-- n16_MUX_uxn_opcodes_h_l878_c7_7e10
n16_MUX_uxn_opcodes_h_l878_c7_7e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l878_c7_7e10_cond,
n16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue,
n16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse,
n16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10
result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_cond,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4
BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l882_c7_08c6
tmp16_MUX_uxn_opcodes_h_l882_c7_08c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_cond,
tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output);

-- n16_MUX_uxn_opcodes_h_l882_c7_08c6
n16_MUX_uxn_opcodes_h_l882_c7_08c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l882_c7_08c6_cond,
n16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue,
n16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse,
n16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6
result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88
BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_left,
BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_right,
BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_left,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_right,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_return_output);

-- sp_relative_shift_uxn_opcodes_h_l885_c30_8113
sp_relative_shift_uxn_opcodes_h_l885_c30_8113 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l885_c30_8113_ins,
sp_relative_shift_uxn_opcodes_h_l885_c30_8113_x,
sp_relative_shift_uxn_opcodes_h_l885_c30_8113_y,
sp_relative_shift_uxn_opcodes_h_l885_c30_8113_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862
BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83
result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_cond,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_return_output);

-- CONST_SR_8_uxn_opcodes_h_l893_c31_af62
CONST_SR_8_uxn_opcodes_h_l893_c31_af62 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l893_c31_af62_x,
CONST_SR_8_uxn_opcodes_h_l893_c31_af62_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output,
 t16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 n16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output,
 t16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output,
 tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output,
 n16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output,
 t16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output,
 n16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output,
 t16_MUX_uxn_opcodes_h_l874_c7_a951_return_output,
 tmp16_MUX_uxn_opcodes_h_l874_c7_a951_return_output,
 n16_MUX_uxn_opcodes_h_l874_c7_a951_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_return_output,
 BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output,
 tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output,
 n16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output,
 tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output,
 n16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_return_output,
 sp_relative_shift_uxn_opcodes_h_l885_c30_8113_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_return_output,
 CONST_SR_8_uxn_opcodes_h_l893_c31_af62_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_5105 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_9880 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_e71c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_85b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_f4e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l884_c3_4b89 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_2f8e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_44b7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_3986 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_c091 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_af62_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_af62_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_3747_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l878_l874_l869_l866_l853_l890_DUPLICATE_4a11_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l878_l874_l869_l866_l890_DUPLICATE_73f9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_DUPLICATE_dfef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_l890_DUPLICATE_d33c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l879_l875_l870_l883_DUPLICATE_ed05_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_6a96_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l849_l897_DUPLICATE_a7dd_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_5105 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_5105;
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_9880 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_9880;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_c091 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_c091;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_e71c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_e71c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_2f8e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_2f8e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_f4e3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_f4e3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_85b0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_85b0;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_3986 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_3986;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_af62_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse := tmp16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_48a9_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l878_l874_l869_l866_l853_l890_DUPLICATE_4a11 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l878_l874_l869_l866_l853_l890_DUPLICATE_4a11_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l874_c11_e80a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_left;
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output := BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l878_l874_l869_l866_l890_DUPLICATE_73f9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l878_l874_l869_l866_l890_DUPLICATE_73f9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l866_c11_a728] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_left;
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output := BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_6a96 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_6a96_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_0ea4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_l890_DUPLICATE_d33c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_l890_DUPLICATE_d33c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l853_c6_bf76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_left;
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output := BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l869_c11_bf03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_left;
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output := BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l879_l875_l870_l883_DUPLICATE_ed05 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l879_l875_l870_l883_DUPLICATE_ed05_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l893_c31_af62] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l893_c31_af62_x <= VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_af62_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_af62_return_output := CONST_SR_8_uxn_opcodes_h_l893_c31_af62_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_48a9_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l878_c11_0640] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_left;
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output := BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l885_c30_8113] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l885_c30_8113_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_ins;
     sp_relative_shift_uxn_opcodes_h_l885_c30_8113_x <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_x;
     sp_relative_shift_uxn_opcodes_h_l885_c30_8113_y <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_return_output := sp_relative_shift_uxn_opcodes_h_l885_c30_8113_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_48a9_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c11_d862] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_DUPLICATE_dfef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_DUPLICATE_dfef_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_48a9_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_bf76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_a728_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_bf03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_e80a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_0640_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_0ea4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_d862_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l879_l875_l870_l883_DUPLICATE_ed05_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l879_l875_l870_l883_DUPLICATE_ed05_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l879_l875_l870_l883_DUPLICATE_ed05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l878_l874_l869_l866_l890_DUPLICATE_73f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l878_l874_l869_l866_l890_DUPLICATE_73f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l878_l874_l869_l866_l890_DUPLICATE_73f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l878_l874_l869_l866_l890_DUPLICATE_73f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l878_l874_l869_l866_l890_DUPLICATE_73f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_l890_DUPLICATE_d33c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_l890_DUPLICATE_d33c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_l890_DUPLICATE_d33c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_l890_DUPLICATE_d33c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_l890_DUPLICATE_d33c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_l890_DUPLICATE_d33c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_DUPLICATE_dfef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_DUPLICATE_dfef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_DUPLICATE_dfef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_DUPLICATE_dfef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l878_l874_l869_l866_DUPLICATE_dfef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_6a96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_6a96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l878_l874_l869_l866_l853_l890_DUPLICATE_4a11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l878_l874_l869_l866_l853_l890_DUPLICATE_4a11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l878_l874_l869_l866_l853_l890_DUPLICATE_4a11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l878_l874_l869_l866_l853_l890_DUPLICATE_4a11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l878_l874_l869_l866_l853_l890_DUPLICATE_4a11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l878_l874_l869_l866_l853_l890_DUPLICATE_4a11_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_48a9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_48a9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_48a9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_48a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_8113_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_be83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l893_c21_3747] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_3747_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_af62_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_08c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l883_c3_fe88] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_left;
     BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_return_output := BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_be83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l875_c3_c553] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_left;
     BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_return_output := BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_be83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_c553_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_right := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_fe88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_3747_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_a1f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_be83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_be83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_be83_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_08c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_7e10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;

     -- n16_MUX[uxn_opcodes_h_l882_c7_08c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l882_c7_08c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_cond;
     n16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue;
     n16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output := n16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;

     -- t16_MUX[uxn_opcodes_h_l874_c7_a951] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l874_c7_a951_cond <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_cond;
     t16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue;
     t16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_return_output := t16_MUX_uxn_opcodes_h_l874_c7_a951_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_08c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_08c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l890_c7_be83] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_cond;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_return_output := result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_b079] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_left;
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_return_output := BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l884_c3_4b89 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_b079_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse := VAR_n16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_be83_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l874_c7_a951_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue := VAR_tmp16_uxn_opcodes_h_l884_c3_4b89;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_7e10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l882_c7_08c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_cond;
     tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output := tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l888_c21_44b7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_44b7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l884_c3_4b89);

     -- n16_MUX[uxn_opcodes_h_l878_c7_7e10] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l878_c7_7e10_cond <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_cond;
     n16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue;
     n16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output := n16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_a951] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_7e10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_7e10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;

     -- t16_MUX[uxn_opcodes_h_l869_c7_a7e2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond;
     t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue;
     t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output := t16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_44b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse := VAR_n16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_a951_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse := VAR_t16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_a7e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l882_c7_08c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;

     -- t16_MUX[uxn_opcodes_h_l866_c7_ee62] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l866_c7_ee62_cond <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_cond;
     t16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue;
     t16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output := t16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_a951] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_return_output;

     -- n16_MUX[uxn_opcodes_h_l874_c7_a951] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l874_c7_a951_cond <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_cond;
     n16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue;
     n16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_return_output := n16_MUX_uxn_opcodes_h_l874_c7_a951_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l878_c7_7e10] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_cond;
     tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue;
     tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output := tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_a951] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_a951] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l874_c7_a951_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_a951_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_a951_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_a951_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_08c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_a7e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l869_c7_a7e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond;
     n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue;
     n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output := n16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l874_c7_a951] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l874_c7_a951_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_cond;
     tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iftrue;
     tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_return_output := tmp16_MUX_uxn_opcodes_h_l874_c7_a951_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_ee62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_a7e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_a7e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;

     -- t16_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     t16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     t16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := t16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l878_c7_7e10] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_cond;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_return_output := result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse := VAR_n16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_7e10_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_a951_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_ee62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;

     -- n16_MUX[uxn_opcodes_h_l866_c7_ee62] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l866_c7_ee62_cond <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_cond;
     n16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue;
     n16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output := n16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l869_c7_a7e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_cond;
     tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output := tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_ee62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l874_c7_a951] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_cond;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_return_output := result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_ee62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_a951_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;
     -- n16_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     n16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     n16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := n16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l866_c7_ee62] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_cond;
     tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue;
     tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output := tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l869_c7_a7e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_a7e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l866_c7_ee62] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_cond;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_return_output := result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_ee62_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l853_c2_48a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l849_l897_DUPLICATE_a7dd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l849_l897_DUPLICATE_a7dd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_48a9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_48a9_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l849_l897_DUPLICATE_a7dd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l849_l897_DUPLICATE_a7dd_return_output;
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
