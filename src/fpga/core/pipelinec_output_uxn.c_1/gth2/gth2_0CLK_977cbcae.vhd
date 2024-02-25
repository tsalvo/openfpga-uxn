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
-- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_4a30]
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1844_c2_677e]
signal t16_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1844_c2_677e]
signal n16_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_677e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_677e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_677e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_677e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_677e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_677e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_677e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_677e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_677e]
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_fb24]
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1857_c7_e7b8]
signal t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1857_c7_e7b8]
signal n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_e7b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_e7b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_e7b8]
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_e7b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_e7b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_1160]
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1860_c7_7ecf]
signal t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1860_c7_7ecf]
signal n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_7ecf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_7ecf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_7ecf]
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_7ecf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_7ecf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_3336]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1865_c7_2f21]
signal t16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1865_c7_2f21]
signal n16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_2f21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_2f21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_2f21]
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_2f21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_2f21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1866_c3_05e5]
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_fa71]
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1869_c7_ecc8]
signal n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_ecc8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_ecc8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_ecc8]
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_ecc8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_ecc8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_95e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1873_c7_525a]
signal n16_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_525a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_525a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_525a]
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_525a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_525a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1874_c3_fb62]
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1875_c30_2a64]
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1878_c21_8c23]
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1878_c21_ab77]
signal MUX_uxn_opcodes_h_l1878_c21_ab77_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_ab77_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_ab77_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_ab77_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_left,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_right,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output);

-- t16_MUX_uxn_opcodes_h_l1844_c2_677e
t16_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
t16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
t16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
t16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- n16_MUX_uxn_opcodes_h_l1844_c2_677e
n16_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
n16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
n16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
n16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_left,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_right,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output);

-- t16_MUX_uxn_opcodes_h_l1857_c7_e7b8
t16_MUX_uxn_opcodes_h_l1857_c7_e7b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond,
t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue,
t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse,
t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output);

-- n16_MUX_uxn_opcodes_h_l1857_c7_e7b8
n16_MUX_uxn_opcodes_h_l1857_c7_e7b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond,
n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue,
n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse,
n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_left,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_right,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output);

-- t16_MUX_uxn_opcodes_h_l1860_c7_7ecf
t16_MUX_uxn_opcodes_h_l1860_c7_7ecf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond,
t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue,
t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse,
t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output);

-- n16_MUX_uxn_opcodes_h_l1860_c7_7ecf
n16_MUX_uxn_opcodes_h_l1860_c7_7ecf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond,
n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue,
n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse,
n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output);

-- t16_MUX_uxn_opcodes_h_l1865_c7_2f21
t16_MUX_uxn_opcodes_h_l1865_c7_2f21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond,
t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue,
t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse,
t16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output);

-- n16_MUX_uxn_opcodes_h_l1865_c7_2f21
n16_MUX_uxn_opcodes_h_l1865_c7_2f21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond,
n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue,
n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse,
n16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_cond,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5
BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_left,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_right,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_left,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_right,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output);

-- n16_MUX_uxn_opcodes_h_l1869_c7_ecc8
n16_MUX_uxn_opcodes_h_l1869_c7_ecc8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond,
n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue,
n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse,
n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output);

-- n16_MUX_uxn_opcodes_h_l1873_c7_525a
n16_MUX_uxn_opcodes_h_l1873_c7_525a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1873_c7_525a_cond,
n16_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue,
n16_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse,
n16_MUX_uxn_opcodes_h_l1873_c7_525a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62
BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_left,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_right,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64
sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_ins,
sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_x,
sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_y,
sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23
BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_left,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_right,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_return_output);

-- MUX_uxn_opcodes_h_l1878_c21_ab77
MUX_uxn_opcodes_h_l1878_c21_ab77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1878_c21_ab77_cond,
MUX_uxn_opcodes_h_l1878_c21_ab77_iftrue,
MUX_uxn_opcodes_h_l1878_c21_ab77_iffalse,
MUX_uxn_opcodes_h_l1878_c21_ab77_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786
CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output,
 t16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 n16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output,
 t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output,
 n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output,
 t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output,
 n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output,
 t16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output,
 n16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output,
 n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output,
 n16_MUX_uxn_opcodes_h_l1873_c7_525a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_return_output,
 sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_return_output,
 MUX_uxn_opcodes_h_l1878_c21_ab77_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_4989 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_5706 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_e2a8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_3394 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_73a3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_5f15 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1844_l1873_l1869_DUPLICATE_62fa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_f729_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_630c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_4573_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_afe8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_3f3e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1882_l1840_DUPLICATE_3be4_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_73a3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_73a3;
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_5706 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_5706;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_5f15 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_5f15;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_4989 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_4989;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_3394 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_3394;
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_e2a8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_e2a8;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_4a30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_left;
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output := BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1844_l1873_l1869_DUPLICATE_62fa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1844_l1873_l1869_DUPLICATE_62fa_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_4573 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_4573_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_677e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_fa71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_f729 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_f729_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_1160] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_left;
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output := BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_afe8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_afe8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_3336] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_677e_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_677e_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_fb24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_left;
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output := BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_677e_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_3f3e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_3f3e_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1875_c30_2a64] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_ins;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_x;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_return_output := sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_630c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_630c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_95e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_4a30_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_fb24_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_1160_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_3336_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fa71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_95e6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_afe8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_afe8_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_afe8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_f729_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_f729_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_f729_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_f729_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_f729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_4573_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_4573_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_4573_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_4573_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_4573_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_630c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_630c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_630c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_630c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1873_l1869_DUPLICATE_630c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_3f3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_3f3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1844_l1873_l1869_DUPLICATE_62fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1844_l1873_l1869_DUPLICATE_62fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1844_l1873_l1869_DUPLICATE_62fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1844_l1873_l1869_DUPLICATE_62fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1844_l1873_l1869_DUPLICATE_62fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1865_l1860_l1857_l1844_l1873_l1869_DUPLICATE_62fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_677e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_677e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_677e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_677e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_2a64_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1874_c3_fb62] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_left;
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_return_output := BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_525a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_525a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1866_c3_05e5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_left;
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_return_output := BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_525a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_525a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_05e5_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_fb62_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_7786_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_ecc8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_ecc8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1873_c7_525a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1873_c7_525a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_cond;
     n16_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue;
     n16_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_return_output := n16_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1878_c21_8c23] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_left;
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_return_output := BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_ecc8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_ecc8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1865_c7_2f21] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond;
     t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue;
     t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output := t16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_8c23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;
     -- n16_MUX[uxn_opcodes_h_l1869_c7_ecc8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond;
     n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue;
     n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output := n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1860_c7_7ecf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond;
     t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue;
     t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output := t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_2f21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_2f21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;

     -- MUX[uxn_opcodes_h_l1878_c21_ab77] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1878_c21_ab77_cond <= VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_cond;
     MUX_uxn_opcodes_h_l1878_c21_ab77_iftrue <= VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_iftrue;
     MUX_uxn_opcodes_h_l1878_c21_ab77_iffalse <= VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_return_output := MUX_uxn_opcodes_h_l1878_c21_ab77_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_2f21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_2f21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue := VAR_MUX_uxn_opcodes_h_l1878_c21_ab77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_7ecf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_525a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1865_c7_2f21] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_cond;
     n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue;
     n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output := n16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_7ecf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_7ecf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1857_c7_e7b8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond;
     t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue;
     t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output := t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_7ecf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_525a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;
     -- n16_MUX[uxn_opcodes_h_l1860_c7_7ecf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond;
     n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue;
     n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output := n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_e7b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_ecc8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     t16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     t16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := t16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_e7b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_e7b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_e7b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_ecc8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_2f21] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output := result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1857_c7_e7b8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond;
     n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue;
     n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output := n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2f21_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_7ecf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     n16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     n16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := n16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_7ecf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_e7b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_e7b8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_677e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1882_l1840_DUPLICATE_3be4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1882_l1840_DUPLICATE_3be4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_677e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_677e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1882_l1840_DUPLICATE_3be4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1882_l1840_DUPLICATE_3be4_return_output;
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
