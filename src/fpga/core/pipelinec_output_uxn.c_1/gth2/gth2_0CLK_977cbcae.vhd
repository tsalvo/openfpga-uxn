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
-- BIN_OP_EQ[uxn_opcodes_h_l1845_c6_5c48]
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1845_c2_f4ed]
signal t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_60aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1858_c7_3e9c]
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_3e9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_3e9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_3e9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_3e9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1858_c7_3e9c]
signal n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1858_c7_3e9c]
signal t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_ac20]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1861_c7_92b6]
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_92b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c7_92b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c7_92b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_92b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1861_c7_92b6]
signal n16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1861_c7_92b6]
signal t16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_10ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1866_c7_eeb6]
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1866_c7_eeb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_eeb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_eeb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_eeb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1866_c7_eeb6]
signal n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1866_c7_eeb6]
signal t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1867_c3_4cd2]
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_22dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1870_c7_107a]
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_107a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_107a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_107a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_107a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1870_c7_107a]
signal n16_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_162e]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_e492]
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_e492]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_e492]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_e492]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_e492]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1874_c7_e492]
signal n16_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1875_c3_b62d]
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1876_c30_15ea]
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1879_c21_8aae]
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1879_c21_710b]
signal MUX_uxn_opcodes_h_l1879_c21_710b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_710b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_710b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_710b_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_left,
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_right,
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- n16_MUX_uxn_opcodes_h_l1845_c2_f4ed
n16_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- t16_MUX_uxn_opcodes_h_l1845_c2_f4ed
t16_MUX_uxn_opcodes_h_l1845_c2_f4ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond,
t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue,
t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse,
t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output);

-- n16_MUX_uxn_opcodes_h_l1858_c7_3e9c
n16_MUX_uxn_opcodes_h_l1858_c7_3e9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond,
n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue,
n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse,
n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output);

-- t16_MUX_uxn_opcodes_h_l1858_c7_3e9c
t16_MUX_uxn_opcodes_h_l1858_c7_3e9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond,
t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue,
t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse,
t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output);

-- n16_MUX_uxn_opcodes_h_l1861_c7_92b6
n16_MUX_uxn_opcodes_h_l1861_c7_92b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond,
n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue,
n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse,
n16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output);

-- t16_MUX_uxn_opcodes_h_l1861_c7_92b6
t16_MUX_uxn_opcodes_h_l1861_c7_92b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond,
t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue,
t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse,
t16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output);

-- n16_MUX_uxn_opcodes_h_l1866_c7_eeb6
n16_MUX_uxn_opcodes_h_l1866_c7_eeb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond,
n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue,
n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse,
n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output);

-- t16_MUX_uxn_opcodes_h_l1866_c7_eeb6
t16_MUX_uxn_opcodes_h_l1866_c7_eeb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond,
t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue,
t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse,
t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2
BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_left,
BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_right,
BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_return_output);

-- n16_MUX_uxn_opcodes_h_l1870_c7_107a
n16_MUX_uxn_opcodes_h_l1870_c7_107a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1870_c7_107a_cond,
n16_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue,
n16_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse,
n16_MUX_uxn_opcodes_h_l1870_c7_107a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_cond,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_return_output);

-- n16_MUX_uxn_opcodes_h_l1874_c7_e492
n16_MUX_uxn_opcodes_h_l1874_c7_e492 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1874_c7_e492_cond,
n16_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue,
n16_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse,
n16_MUX_uxn_opcodes_h_l1874_c7_e492_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d
BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_left,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_right,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea
sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_ins,
sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_x,
sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_y,
sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae
BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_left,
BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_right,
BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_return_output);

-- MUX_uxn_opcodes_h_l1879_c21_710b
MUX_uxn_opcodes_h_l1879_c21_710b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1879_c21_710b_cond,
MUX_uxn_opcodes_h_l1879_c21_710b_iftrue,
MUX_uxn_opcodes_h_l1879_c21_710b_iffalse,
MUX_uxn_opcodes_h_l1879_c21_710b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62
CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output,
 n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output,
 t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output,
 n16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output,
 t16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output,
 n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output,
 t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_return_output,
 n16_MUX_uxn_opcodes_h_l1870_c7_107a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_return_output,
 n16_MUX_uxn_opcodes_h_l1874_c7_e492_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_return_output,
 MUX_uxn_opcodes_h_l1879_c21_710b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_dfa7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_7c25 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_241c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_25f1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_4cb0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_3381 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_710b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_710b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_710b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_710b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1874_l1870_l1866_l1861_l1858_DUPLICATE_7a2c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_6311_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_c5c2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8c35_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1867_l1875_l1862_DUPLICATE_1fa2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_8b23_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1883_l1841_DUPLICATE_974c_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_dfa7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_dfa7;
     VAR_MUX_uxn_opcodes_h_l1879_c21_710b_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1879_c21_710b_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_4cb0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_4cb0;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_7c25 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_7c25;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_3381 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_3381;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_241c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_241c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_25f1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_25f1;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_162e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_8b23 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_8b23_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_ac20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1845_c6_5c48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8c35 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8c35_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_c5c2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_c5c2_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1876_c30_15ea] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_ins;
     sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_x;
     sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_return_output := sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_6311 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_6311_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_60aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_22dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1874_l1870_l1866_l1861_l1858_DUPLICATE_7a2c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1874_l1870_l1866_l1861_l1858_DUPLICATE_7a2c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_10ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1867_l1875_l1862_DUPLICATE_1fa2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1867_l1875_l1862_DUPLICATE_1fa2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_5c48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_60aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_ac20_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_10ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_22dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_162e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1867_l1875_l1862_DUPLICATE_1fa2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1867_l1875_l1862_DUPLICATE_1fa2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1867_l1875_l1862_DUPLICATE_1fa2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_c5c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_c5c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_c5c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_c5c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_c5c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8c35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8c35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8c35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8c35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_8c35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_6311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_6311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_6311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_6311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1874_l1870_l1866_l1861_l1858_DUPLICATE_6311_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_8b23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_8b23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1874_l1870_l1866_l1861_l1858_DUPLICATE_7a2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1874_l1870_l1866_l1861_l1858_DUPLICATE_7a2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1874_l1870_l1866_l1861_l1858_DUPLICATE_7a2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1874_l1870_l1866_l1861_l1858_DUPLICATE_7a2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1874_l1870_l1866_l1861_l1858_DUPLICATE_7a2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1845_l1874_l1870_l1866_l1861_l1858_DUPLICATE_7a2c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_f4ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_15ea_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1867_c3_4cd2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_left;
     BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_return_output := BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_e492] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_e492] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_e492] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_e492] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1875_c3_b62d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_left;
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_return_output := BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_4cd2_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_b62d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_6e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_107a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_107a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_107a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1879_c21_8aae] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_left;
     BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_return_output := BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_107a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1866_c7_eeb6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond;
     t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue;
     t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output := t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1874_c7_e492] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1874_c7_e492_cond <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_cond;
     n16_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue;
     n16_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_return_output := n16_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1879_c21_710b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_8aae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;
     -- n16_MUX[uxn_opcodes_h_l1870_c7_107a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1870_c7_107a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_cond;
     n16_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue;
     n16_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_return_output := n16_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_eeb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;

     -- MUX[uxn_opcodes_h_l1879_c21_710b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1879_c21_710b_cond <= VAR_MUX_uxn_opcodes_h_l1879_c21_710b_cond;
     MUX_uxn_opcodes_h_l1879_c21_710b_iftrue <= VAR_MUX_uxn_opcodes_h_l1879_c21_710b_iftrue;
     MUX_uxn_opcodes_h_l1879_c21_710b_iffalse <= VAR_MUX_uxn_opcodes_h_l1879_c21_710b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1879_c21_710b_return_output := MUX_uxn_opcodes_h_l1879_c21_710b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_eeb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_eeb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1866_c7_eeb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1861_c7_92b6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond;
     t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue;
     t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output := t16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue := VAR_MUX_uxn_opcodes_h_l1879_c21_710b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;
     -- t16_MUX[uxn_opcodes_h_l1858_c7_3e9c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond;
     t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue;
     t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output := t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_e492] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_return_output := result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c7_92b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_92b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_92b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c7_92b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1866_c7_eeb6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond;
     n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue;
     n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output := n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_e492_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;
     -- n16_MUX[uxn_opcodes_h_l1861_c7_92b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_cond;
     n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue;
     n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output := n16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_3e9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1870_c7_107a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_3e9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_3e9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_3e9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_107a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- n16_MUX[uxn_opcodes_h_l1858_c7_3e9c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond;
     n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue;
     n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output := n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1866_c7_eeb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_eeb6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1861_c7_92b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_92b6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1858_c7_3e9c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_3e9c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1845_c2_f4ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1883_l1841_DUPLICATE_974c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1883_l1841_DUPLICATE_974c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f4ed_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1883_l1841_DUPLICATE_974c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1883_l1841_DUPLICATE_974c_return_output;
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
