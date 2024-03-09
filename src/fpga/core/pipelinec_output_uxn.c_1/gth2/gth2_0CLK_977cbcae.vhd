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
-- BIN_OP_EQ[uxn_opcodes_h_l1845_c6_c0b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c2_f1ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_1d2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1858_c7_896e]
signal n16_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1858_c7_896e]
signal t16_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1858_c7_896e]
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_896e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_896e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_896e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_896e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_7604]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1861_c7_4b55]
signal n16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1861_c7_4b55]
signal t16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1861_c7_4b55]
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_4b55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_4b55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c7_4b55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c7_4b55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_fe15]
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1866_c7_f80f]
signal n16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1866_c7_f80f]
signal t16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1866_c7_f80f]
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_f80f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1866_c7_f80f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_f80f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_f80f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1867_c3_650f]
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_dd81]
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1870_c7_25a7]
signal n16_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1870_c7_25a7]
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_25a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_25a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_25a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_25a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_b568]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1874_c7_31d3]
signal n16_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_31d3]
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_31d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_31d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_31d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_31d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1875_c3_69f4]
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1876_c30_9b58]
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1879_c21_884a]
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1879_c21_a161]
signal MUX_uxn_opcodes_h_l1879_c21_a161_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_a161_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_a161_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1879_c21_a161_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output);

-- n16_MUX_uxn_opcodes_h_l1845_c2_f1ba
n16_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- t16_MUX_uxn_opcodes_h_l1845_c2_f1ba
t16_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output);

-- n16_MUX_uxn_opcodes_h_l1858_c7_896e
n16_MUX_uxn_opcodes_h_l1858_c7_896e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1858_c7_896e_cond,
n16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue,
n16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse,
n16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output);

-- t16_MUX_uxn_opcodes_h_l1858_c7_896e
t16_MUX_uxn_opcodes_h_l1858_c7_896e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1858_c7_896e_cond,
t16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue,
t16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse,
t16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output);

-- n16_MUX_uxn_opcodes_h_l1861_c7_4b55
n16_MUX_uxn_opcodes_h_l1861_c7_4b55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond,
n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue,
n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse,
n16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output);

-- t16_MUX_uxn_opcodes_h_l1861_c7_4b55
t16_MUX_uxn_opcodes_h_l1861_c7_4b55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond,
t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue,
t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse,
t16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_cond,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_left,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_right,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output);

-- n16_MUX_uxn_opcodes_h_l1866_c7_f80f
n16_MUX_uxn_opcodes_h_l1866_c7_f80f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond,
n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue,
n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse,
n16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output);

-- t16_MUX_uxn_opcodes_h_l1866_c7_f80f
t16_MUX_uxn_opcodes_h_l1866_c7_f80f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond,
t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue,
t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse,
t16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f
BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_left,
BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_right,
BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_left,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_right,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output);

-- n16_MUX_uxn_opcodes_h_l1870_c7_25a7
n16_MUX_uxn_opcodes_h_l1870_c7_25a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1870_c7_25a7_cond,
n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue,
n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse,
n16_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output);

-- n16_MUX_uxn_opcodes_h_l1874_c7_31d3
n16_MUX_uxn_opcodes_h_l1874_c7_31d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1874_c7_31d3_cond,
n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue,
n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse,
n16_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4
BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_left,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_right,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58
sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_ins,
sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_x,
sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_y,
sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a
BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_left,
BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_right,
BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_return_output);

-- MUX_uxn_opcodes_h_l1879_c21_a161
MUX_uxn_opcodes_h_l1879_c21_a161 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1879_c21_a161_cond,
MUX_uxn_opcodes_h_l1879_c21_a161_iftrue,
MUX_uxn_opcodes_h_l1879_c21_a161_iffalse,
MUX_uxn_opcodes_h_l1879_c21_a161_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output,
 n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output,
 n16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output,
 t16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output,
 n16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output,
 t16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output,
 n16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output,
 t16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output,
 n16_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output,
 n16_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_return_output,
 MUX_uxn_opcodes_h_l1879_c21_a161_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_4f6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_4773 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_8c0d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_521f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_f046 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_6145 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_a161_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_a161_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_a161_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1879_c21_a161_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1861_l1858_l1845_l1874_l1870_l1866_DUPLICATE_6939_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_74f6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_77f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_d349_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1871_l1875_l1867_DUPLICATE_4a5c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_fd80_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1883_l1841_DUPLICATE_f8c9_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1879_c21_a161_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_4773 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_4773;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_4f6d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_4f6d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_521f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_521f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_6145 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1878_c3_6145;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1879_c21_a161_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_8c0d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1859_c3_8c0d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_f046 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_f046;
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse := t16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_74f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_74f6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_1d2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_d349 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_d349_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_7604] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1861_l1858_l1845_l1874_l1870_l1866_DUPLICATE_6939 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1861_l1858_l1845_l1874_l1870_l1866_DUPLICATE_6939_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_fd80 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_fd80_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_fe15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_left;
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output := BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_dd81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_left;
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output := BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_b568] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1871_l1875_l1867_DUPLICATE_4a5c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1871_l1875_l1867_DUPLICATE_4a5c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1845_c6_c0b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1876_c30_9b58] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_ins;
     sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_x;
     sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_return_output := sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_77f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_77f7_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c6_c0b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_1d2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_7604_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_fe15_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_dd81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_b568_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1871_l1875_l1867_DUPLICATE_4a5c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1871_l1875_l1867_DUPLICATE_4a5c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1862_l1871_l1875_l1867_DUPLICATE_4a5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_d349_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_d349_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_d349_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_d349_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_d349_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_74f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_74f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_74f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_74f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_74f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_77f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_77f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_77f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_77f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1861_l1858_l1874_l1870_l1866_DUPLICATE_77f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_fd80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1874_l1870_DUPLICATE_fd80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1861_l1858_l1845_l1874_l1870_l1866_DUPLICATE_6939_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1861_l1858_l1845_l1874_l1870_l1866_DUPLICATE_6939_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1861_l1858_l1845_l1874_l1870_l1866_DUPLICATE_6939_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1861_l1858_l1845_l1874_l1870_l1866_DUPLICATE_6939_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1861_l1858_l1845_l1874_l1870_l1866_DUPLICATE_6939_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1861_l1858_l1845_l1874_l1870_l1866_DUPLICATE_6939_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1845_c2_f1ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1876_c30_9b58_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1875_c3_69f4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_left;
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_return_output := BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_31d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1867_c3_650f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_left;
     BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_return_output := BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_31d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_31d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_31d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1867_c3_650f_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_69f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1863_l1872_DUPLICATE_537d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_25a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1879_c21_884a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_left;
     BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_return_output := BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_25a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_25a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1874_c7_31d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1874_c7_31d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_cond;
     n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue;
     n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output := n16_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_25a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1866_c7_f80f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond;
     t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue;
     t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output := t16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1879_c21_a161_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1879_c21_884a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;
     -- MUX[uxn_opcodes_h_l1879_c21_a161] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1879_c21_a161_cond <= VAR_MUX_uxn_opcodes_h_l1879_c21_a161_cond;
     MUX_uxn_opcodes_h_l1879_c21_a161_iftrue <= VAR_MUX_uxn_opcodes_h_l1879_c21_a161_iftrue;
     MUX_uxn_opcodes_h_l1879_c21_a161_iffalse <= VAR_MUX_uxn_opcodes_h_l1879_c21_a161_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1879_c21_a161_return_output := MUX_uxn_opcodes_h_l1879_c21_a161_return_output;

     -- t16_MUX[uxn_opcodes_h_l1861_c7_4b55] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond;
     t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue;
     t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output := t16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_f80f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1870_c7_25a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1870_c7_25a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_cond;
     n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue;
     n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output := n16_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1866_c7_f80f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_f80f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_f80f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue := VAR_MUX_uxn_opcodes_h_l1879_c21_a161_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c7_4b55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_31d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_4b55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;

     -- t16_MUX[uxn_opcodes_h_l1858_c7_896e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1858_c7_896e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_cond;
     t16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue;
     t16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output := t16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_4b55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c7_4b55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;

     -- n16_MUX[uxn_opcodes_h_l1866_c7_f80f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_cond;
     n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue;
     n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output := n16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_31d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_896e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_896e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_896e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1870_c7_25a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- n16_MUX[uxn_opcodes_h_l1861_c7_4b55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_cond;
     n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue;
     n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output := n16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_896e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_25a7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;
     -- n16_MUX[uxn_opcodes_h_l1858_c7_896e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1858_c7_896e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_cond;
     n16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue;
     n16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output := n16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1866_c7_f80f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1866_c7_f80f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1861_c7_4b55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output := result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c7_4b55_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1858_c7_896e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1858_c7_896e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1845_c2_f1ba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output := result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1883_l1841_DUPLICATE_f8c9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1883_l1841_DUPLICATE_f8c9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c2_f1ba_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1883_l1841_DUPLICATE_f8c9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1883_l1841_DUPLICATE_f8c9_return_output;
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
