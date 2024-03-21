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
-- Submodules: 58
entity gth2_0CLK_977cbcae is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_977cbcae;
architecture arch of gth2_0CLK_977cbcae is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1845_c6_9f07]
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal n16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal t16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c2_6c30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_1e07]
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1858_c7_a358]
signal n16_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1858_c7_a358]
signal t16_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_a358]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_a358]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_a358]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1858_c7_a358]
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_a358]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_7d71]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1861_c7_7719]
signal n16_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1861_c7_7719]
signal t16_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c7_7719]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_7719]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c7_7719]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1861_c7_7719]
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_7719]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_6712]
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1866_c7_0bd2]
signal n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1866_c7_0bd2]
signal t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_0bd2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_0bd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_0bd2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1866_c7_0bd2]
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1866_c7_0bd2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1867_c3_ad51]
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_5a23]
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1870_c7_3eb8]
signal n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_3eb8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_3eb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_3eb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1870_c7_3eb8]
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_3eb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_ba94]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1874_c7_9eb6]
signal n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_9eb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_9eb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_9eb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_9eb6]
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_9eb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1875_c3_7f62]
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1876_c30_be86]
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1879_c21_9af6]
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1879_c21_b4e3]
signal MUX_uxn_opcodes_h_l1879_c21_b4e3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_b4e3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_b4e3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_b4e3_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_left,
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_right,
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output);

-- n16_MUX_uxn_opcodes_h_l1845_c2_6c30
n16_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
n16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- t16_MUX_uxn_opcodes_h_l1845_c2_6c30
t16_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
t16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_left,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_right,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output);

-- n16_MUX_uxn_opcodes_h_l1858_c7_a358
n16_MUX_uxn_opcodes_h_l1858_c7_a358 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1858_c7_a358_cond,
n16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue,
n16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse,
n16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output);

-- t16_MUX_uxn_opcodes_h_l1858_c7_a358
t16_MUX_uxn_opcodes_h_l1858_c7_a358 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1858_c7_a358_cond,
t16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue,
t16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse,
t16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_cond,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output);

-- n16_MUX_uxn_opcodes_h_l1861_c7_7719
n16_MUX_uxn_opcodes_h_l1861_c7_7719 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1861_c7_7719_cond,
n16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue,
n16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse,
n16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output);

-- t16_MUX_uxn_opcodes_h_l1861_c7_7719
t16_MUX_uxn_opcodes_h_l1861_c7_7719 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1861_c7_7719_cond,
t16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue,
t16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse,
t16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_cond,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_left,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_right,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output);

-- n16_MUX_uxn_opcodes_h_l1866_c7_0bd2
n16_MUX_uxn_opcodes_h_l1866_c7_0bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond,
n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue,
n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse,
n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output);

-- t16_MUX_uxn_opcodes_h_l1866_c7_0bd2
t16_MUX_uxn_opcodes_h_l1866_c7_0bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond,
t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue,
t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse,
t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51
BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_left,
BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_right,
BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_left,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_right,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output);

-- n16_MUX_uxn_opcodes_h_l1870_c7_3eb8
n16_MUX_uxn_opcodes_h_l1870_c7_3eb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond,
n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue,
n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse,
n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output);

-- n16_MUX_uxn_opcodes_h_l1874_c7_9eb6
n16_MUX_uxn_opcodes_h_l1874_c7_9eb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond,
n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue,
n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse,
n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62
BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_left,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_right,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1876_c30_be86
sp_relative_shift_uxn_opcodes_h_l1876_c30_be86 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_ins,
sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_x,
sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_y,
sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6
BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_left,
BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_right,
BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_return_output);

-- MUX_uxn_opcodes_h_l1879_c21_b4e3
MUX_uxn_opcodes_h_l1879_c21_b4e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1879_c21_b4e3_cond,
MUX_uxn_opcodes_h_l1879_c21_b4e3_iftrue,
MUX_uxn_opcodes_h_l1879_c21_b4e3_iffalse,
MUX_uxn_opcodes_h_l1879_c21_b4e3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4
CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output,
 n16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 t16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output,
 n16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output,
 t16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output,
 n16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output,
 t16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output,
 n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output,
 t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output,
 n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output,
 n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_return_output,
 sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_return_output,
 MUX_uxn_opcodes_h_l1879_c21_b4e3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_cbba : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_ce02 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_53bf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_7b35 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_6af0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_e8de : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1845_l1874_DUPLICATE_5442_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_1f63_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_f087_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_c743_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1862_l1867_l1875_DUPLICATE_2285_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1870_l1874_DUPLICATE_5394_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1883_l1841_DUPLICATE_4264_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_e8de := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_e8de;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_6af0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_6af0;
     VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_cbba := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_cbba;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_ce02 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_ce02;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_7b35 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_7b35;
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_53bf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_53bf;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse := t16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1870_l1874_DUPLICATE_5394 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1870_l1874_DUPLICATE_5394_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1876_c30_be86] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_ins;
     sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_x;
     sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_return_output := sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1845_c6_9f07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_7d71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_ba94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_6712] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_left;
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output := BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_1e07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_f087 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_f087_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1862_l1867_l1875_DUPLICATE_2285 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1862_l1867_l1875_DUPLICATE_2285_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1845_l1874_DUPLICATE_5442 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1845_l1874_DUPLICATE_5442_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_1f63 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_1f63_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_c743 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_c743_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_5a23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_left;
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output := BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_9f07_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1e07_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7d71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_6712_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_5a23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ba94_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1862_l1867_l1875_DUPLICATE_2285_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1862_l1867_l1875_DUPLICATE_2285_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1862_l1867_l1875_DUPLICATE_2285_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_1f63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_1f63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_1f63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_1f63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_1f63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_f087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_f087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_f087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_f087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_f087_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_c743_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_c743_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_c743_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_c743_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1874_DUPLICATE_c743_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1870_l1874_DUPLICATE_5394_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1870_l1874_DUPLICATE_5394_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1845_l1874_DUPLICATE_5442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1845_l1874_DUPLICATE_5442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1845_l1874_DUPLICATE_5442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1845_l1874_DUPLICATE_5442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1845_l1874_DUPLICATE_5442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1870_l1866_l1861_l1858_l1845_l1874_DUPLICATE_5442_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_6c30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_be86_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1875_c3_7f62] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_left;
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_return_output := BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_9eb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_9eb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_9eb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_9eb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1867_c3_ad51] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_left;
     BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_return_output := BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_ad51_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_7f62_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_e8e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_3eb8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_3eb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1874_c7_9eb6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond;
     n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue;
     n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output := n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_3eb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_3eb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1866_c7_0bd2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond;
     t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue;
     t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output := t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1879_c21_9af6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_left;
     BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_return_output := BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9af6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;
     -- MUX[uxn_opcodes_h_l1879_c21_b4e3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1879_c21_b4e3_cond <= VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_cond;
     MUX_uxn_opcodes_h_l1879_c21_b4e3_iftrue <= VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_iftrue;
     MUX_uxn_opcodes_h_l1879_c21_b4e3_iffalse <= VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_return_output := MUX_uxn_opcodes_h_l1879_c21_b4e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_0bd2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_0bd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1861_c7_7719] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1861_c7_7719_cond <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_cond;
     t16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue;
     t16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output := t16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_0bd2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1866_c7_0bd2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1870_c7_3eb8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond;
     n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue;
     n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output := n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue := VAR_MUX_uxn_opcodes_h_l1879_c21_b4e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_7719] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;

     -- t16_MUX[uxn_opcodes_h_l1858_c7_a358] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1858_c7_a358_cond <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_cond;
     t16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue;
     t16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output := t16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c7_7719] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c7_7719] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_9eb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1866_c7_0bd2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond;
     n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue;
     n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output := n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_7719] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_9eb6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;
     -- t16_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := t16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_a358] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_a358] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1870_c7_3eb8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_a358] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_a358] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;

     -- n16_MUX[uxn_opcodes_h_l1861_c7_7719] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1861_c7_7719_cond <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_cond;
     n16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue;
     n16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output := n16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_3eb8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- n16_MUX[uxn_opcodes_h_l1858_c7_a358] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1858_c7_a358_cond <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_cond;
     n16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue;
     n16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output := n16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1866_c7_0bd2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_0bd2_return_output;
     -- n16_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := n16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1861_c7_7719] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_return_output := result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_7719_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1858_c7_a358] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_return_output := result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_a358_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1845_c2_6c30] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output := result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1883_l1841_DUPLICATE_4264 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1883_l1841_DUPLICATE_4264_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_6c30_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1883_l1841_DUPLICATE_4264_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1883_l1841_DUPLICATE_4264_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
