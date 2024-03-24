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
-- BIN_OP_EQ[uxn_opcodes_h_l1845_c6_adb1]
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal t16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal n16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1845_c2_1d09]
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_0155]
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1858_c7_dedd]
signal t16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1858_c7_dedd]
signal n16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_dedd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_dedd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_dedd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_dedd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1858_c7_dedd]
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_eb25]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1861_c7_9e49]
signal t16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1861_c7_9e49]
signal n16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c7_9e49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_9e49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c7_9e49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_9e49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1861_c7_9e49]
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_54c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1866_c7_7e84]
signal t16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1866_c7_7e84]
signal n16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_7e84]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_7e84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_7e84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1866_c7_7e84]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1866_c7_7e84]
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1867_c3_da73]
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_1bc2]
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1870_c7_201a]
signal n16_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_201a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_201a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_201a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_201a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1870_c7_201a]
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_08a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1874_c7_47a5]
signal n16_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_47a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_47a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_47a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_47a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_47a5]
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1875_c3_67f1]
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1876_c30_9afc]
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1879_c21_9efe]
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1879_c21_1d07]
signal MUX_uxn_opcodes_h_l1879_c21_1d07_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_1d07_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_1d07_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_1d07_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_left,
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_right,
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output);

-- t16_MUX_uxn_opcodes_h_l1845_c2_1d09
t16_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
t16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- n16_MUX_uxn_opcodes_h_l1845_c2_1d09
n16_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
n16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_cond,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_left,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_right,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output);

-- t16_MUX_uxn_opcodes_h_l1858_c7_dedd
t16_MUX_uxn_opcodes_h_l1858_c7_dedd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond,
t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue,
t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse,
t16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output);

-- n16_MUX_uxn_opcodes_h_l1858_c7_dedd
n16_MUX_uxn_opcodes_h_l1858_c7_dedd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond,
n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue,
n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse,
n16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output);

-- t16_MUX_uxn_opcodes_h_l1861_c7_9e49
t16_MUX_uxn_opcodes_h_l1861_c7_9e49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond,
t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue,
t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse,
t16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output);

-- n16_MUX_uxn_opcodes_h_l1861_c7_9e49
n16_MUX_uxn_opcodes_h_l1861_c7_9e49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond,
n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue,
n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse,
n16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_cond,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output);

-- t16_MUX_uxn_opcodes_h_l1866_c7_7e84
t16_MUX_uxn_opcodes_h_l1866_c7_7e84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond,
t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue,
t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse,
t16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output);

-- n16_MUX_uxn_opcodes_h_l1866_c7_7e84
n16_MUX_uxn_opcodes_h_l1866_c7_7e84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond,
n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue,
n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse,
n16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_cond,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73
BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_left,
BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_right,
BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_left,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_right,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output);

-- n16_MUX_uxn_opcodes_h_l1870_c7_201a
n16_MUX_uxn_opcodes_h_l1870_c7_201a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1870_c7_201a_cond,
n16_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue,
n16_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse,
n16_MUX_uxn_opcodes_h_l1870_c7_201a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output);

-- n16_MUX_uxn_opcodes_h_l1874_c7_47a5
n16_MUX_uxn_opcodes_h_l1874_c7_47a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1874_c7_47a5_cond,
n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue,
n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse,
n16_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1
BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_left,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_right,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc
sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_ins,
sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_x,
sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_y,
sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe
BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_left,
BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_right,
BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_return_output);

-- MUX_uxn_opcodes_h_l1879_c21_1d07
MUX_uxn_opcodes_h_l1879_c21_1d07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1879_c21_1d07_cond,
MUX_uxn_opcodes_h_l1879_c21_1d07_iftrue,
MUX_uxn_opcodes_h_l1879_c21_1d07_iffalse,
MUX_uxn_opcodes_h_l1879_c21_1d07_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output,
 t16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 n16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output,
 t16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output,
 n16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output,
 t16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output,
 n16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output,
 t16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output,
 n16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output,
 n16_MUX_uxn_opcodes_h_l1870_c7_201a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output,
 n16_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_return_output,
 sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_return_output,
 MUX_uxn_opcodes_h_l1879_c21_1d07_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_690d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_b21a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_9b09 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_2443 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_9621 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_cf18 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_l1845_DUPLICATE_6638_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_5c59_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8859_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_4124_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1867_l1871_l1875_DUPLICATE_615b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_71f9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1841_l1883_DUPLICATE_9b44_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_690d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_690d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_2443 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_2443;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_cf18 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_cf18;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_9b09 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_9b09;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_9621 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_9621;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_y := resize(to_signed(-3, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_b21a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_b21a;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_5c59 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_5c59_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1867_l1871_l1875_DUPLICATE_615b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1867_l1871_l1875_DUPLICATE_615b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_08a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_1bc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1876_c30_9afc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_ins;
     sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_x;
     sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_return_output := sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_0155] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_left;
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output := BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8859 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8859_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_54c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_4124 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_4124_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_eb25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_71f9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_71f9_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_l1845_DUPLICATE_6638 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_l1845_DUPLICATE_6638_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1845_c6_adb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_adb1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_0155_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_eb25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_54c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_1bc2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_08a3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1867_l1871_l1875_DUPLICATE_615b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1867_l1871_l1875_DUPLICATE_615b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1867_l1871_l1875_DUPLICATE_615b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_5c59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_5c59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_5c59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_5c59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_5c59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8859_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_4124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_4124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_4124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_4124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_4124_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_71f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_71f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_l1845_DUPLICATE_6638_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_l1845_DUPLICATE_6638_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_l1845_DUPLICATE_6638_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_l1845_DUPLICATE_6638_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_l1845_DUPLICATE_6638_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_l1845_DUPLICATE_6638_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_1d09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9afc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_47a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_47a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_47a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1875_c3_67f1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_left;
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_return_output := BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1867_c3_da73] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_left;
     BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_return_output := BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_47a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_da73_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_67f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1872_l1863_DUPLICATE_32a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_201a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1874_c7_47a5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1874_c7_47a5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_cond;
     n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue;
     n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output := n16_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_201a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_201a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1879_c21_9efe] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_left;
     BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_return_output := BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_201a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1866_c7_7e84] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond;
     t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue;
     t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output := t16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_9efe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_7e84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;

     -- t16_MUX[uxn_opcodes_h_l1861_c7_9e49] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond;
     t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue;
     t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output := t16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_7e84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;

     -- n16_MUX[uxn_opcodes_h_l1870_c7_201a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1870_c7_201a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_cond;
     n16_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue;
     n16_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_return_output := n16_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1866_c7_7e84] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;

     -- MUX[uxn_opcodes_h_l1879_c21_1d07] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1879_c21_1d07_cond <= VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_cond;
     MUX_uxn_opcodes_h_l1879_c21_1d07_iftrue <= VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_iftrue;
     MUX_uxn_opcodes_h_l1879_c21_1d07_iffalse <= VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_return_output := MUX_uxn_opcodes_h_l1879_c21_1d07_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_7e84] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue := VAR_MUX_uxn_opcodes_h_l1879_c21_1d07_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c7_9e49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;

     -- t16_MUX[uxn_opcodes_h_l1858_c7_dedd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond;
     t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue;
     t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output := t16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_9e49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c7_9e49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_47a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1866_c7_7e84] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_cond;
     n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue;
     n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output := n16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_9e49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_47a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_dedd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1870_c7_201a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_dedd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := t16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- n16_MUX[uxn_opcodes_h_l1861_c7_9e49] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_cond;
     n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue;
     n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output := n16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_dedd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_dedd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_201a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1866_c7_7e84] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output := result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- n16_MUX[uxn_opcodes_h_l1858_c7_dedd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_cond;
     n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue;
     n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output := n16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_7e84_return_output;
     -- n16_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := n16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1861_c7_9e49] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output := result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_9e49_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1858_c7_dedd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_dedd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1845_c2_1d09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output := result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1841_l1883_DUPLICATE_9b44 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1841_l1883_DUPLICATE_9b44_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_1d09_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1841_l1883_DUPLICATE_9b44_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1841_l1883_DUPLICATE_9b44_return_output;
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
