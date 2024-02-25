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
-- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_3836]
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal t16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1844_c2_62ae]
signal n16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_69c8]
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1857_c7_cff6]
signal t16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_cff6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_cff6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_cff6]
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_cff6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_cff6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1857_c7_cff6]
signal n16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_f294]
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1860_c7_e11d]
signal t16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_e11d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_e11d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_e11d]
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_e11d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_e11d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1860_c7_e11d]
signal n16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_05bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1865_c7_2350]
signal t16_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_2350]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_2350]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_2350]
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_2350]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_2350]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1865_c7_2350]
signal n16_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1866_c3_3aae]
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_3dcb]
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_f498]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_f498]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_f498]
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_f498]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_f498]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1869_c7_f498]
signal n16_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_cb96]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_2cf1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_2cf1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_2cf1]
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_2cf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_2cf1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1873_c7_2cf1]
signal n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1874_c3_ace9]
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1875_c30_b1ab]
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1878_c21_38f4]
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1878_c21_a69b]
signal MUX_uxn_opcodes_h_l1878_c21_a69b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_a69b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_a69b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_a69b_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_left,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_right,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output);

-- t16_MUX_uxn_opcodes_h_l1844_c2_62ae
t16_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
t16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- n16_MUX_uxn_opcodes_h_l1844_c2_62ae
n16_MUX_uxn_opcodes_h_l1844_c2_62ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond,
n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue,
n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse,
n16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_left,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_right,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output);

-- t16_MUX_uxn_opcodes_h_l1857_c7_cff6
t16_MUX_uxn_opcodes_h_l1857_c7_cff6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond,
t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue,
t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse,
t16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output);

-- n16_MUX_uxn_opcodes_h_l1857_c7_cff6
n16_MUX_uxn_opcodes_h_l1857_c7_cff6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond,
n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue,
n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse,
n16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_left,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_right,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output);

-- t16_MUX_uxn_opcodes_h_l1860_c7_e11d
t16_MUX_uxn_opcodes_h_l1860_c7_e11d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond,
t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue,
t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse,
t16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output);

-- n16_MUX_uxn_opcodes_h_l1860_c7_e11d
n16_MUX_uxn_opcodes_h_l1860_c7_e11d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond,
n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue,
n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse,
n16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output);

-- t16_MUX_uxn_opcodes_h_l1865_c7_2350
t16_MUX_uxn_opcodes_h_l1865_c7_2350 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1865_c7_2350_cond,
t16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue,
t16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse,
t16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_cond,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_return_output);

-- n16_MUX_uxn_opcodes_h_l1865_c7_2350
n16_MUX_uxn_opcodes_h_l1865_c7_2350 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1865_c7_2350_cond,
n16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue,
n16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse,
n16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae
BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_left,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_right,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_left,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_right,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_cond,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_return_output);

-- n16_MUX_uxn_opcodes_h_l1869_c7_f498
n16_MUX_uxn_opcodes_h_l1869_c7_f498 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1869_c7_f498_cond,
n16_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue,
n16_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse,
n16_MUX_uxn_opcodes_h_l1869_c7_f498_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output);

-- n16_MUX_uxn_opcodes_h_l1873_c7_2cf1
n16_MUX_uxn_opcodes_h_l1873_c7_2cf1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond,
n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue,
n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse,
n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9
BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_left,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_right,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab
sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_ins,
sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_x,
sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_y,
sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4
BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_left,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_right,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_return_output);

-- MUX_uxn_opcodes_h_l1878_c21_a69b
MUX_uxn_opcodes_h_l1878_c21_a69b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1878_c21_a69b_cond,
MUX_uxn_opcodes_h_l1878_c21_a69b_iftrue,
MUX_uxn_opcodes_h_l1878_c21_a69b_iffalse,
MUX_uxn_opcodes_h_l1878_c21_a69b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79
CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output,
 t16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 n16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output,
 t16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output,
 n16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output,
 t16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output,
 n16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output,
 t16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_return_output,
 n16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_return_output,
 n16_MUX_uxn_opcodes_h_l1869_c7_f498_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output,
 n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_return_output,
 sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_return_output,
 MUX_uxn_opcodes_h_l1878_c21_a69b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_4c83 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_16ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_c182 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_bf5e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_f089 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_d3c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_51fe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_d375_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_15d1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_b592_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_f775_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_c6ae_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1840_l1882_DUPLICATE_ca00_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_4c83 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_4c83;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_f089 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_f089;
     VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_d3c6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_d3c6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_16ee := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_16ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_bf5e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_bf5e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_c182 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_c182;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_iftrue := resize(to_unsigned(1, 1), 8);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_f294] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_left;
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output := BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_15d1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_15d1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_69c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_f775 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_f775_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_51fe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_51fe_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_3dcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_cb96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_b592 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_b592_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_3836] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_left;
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output := BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1875_c30_b1ab] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_ins;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_x;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_return_output := sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_05bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_c6ae LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_c6ae_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_d375 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_d375_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_3836_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_69c8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_f294_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_05bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_3dcb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_cb96_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_f775_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_f775_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1874_l1870_DUPLICATE_f775_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_15d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_15d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_15d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_15d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_15d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_b592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_b592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_b592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_b592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_b592_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_d375_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_d375_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_d375_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_d375_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1857_l1873_l1869_l1865_l1860_DUPLICATE_d375_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_c6ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_c6ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_51fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_51fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_51fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_51fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_51fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1857_l1844_l1873_l1869_l1865_l1860_DUPLICATE_51fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_62ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_b1ab_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1866_c3_3aae] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_left;
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_return_output := BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1874_c3_ace9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_left;
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_return_output := BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_2cf1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_2cf1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_2cf1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_2cf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_3aae_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_ace9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_9b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_f498] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_f498] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;

     -- n16_MUX[uxn_opcodes_h_l1873_c7_2cf1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond;
     n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue;
     n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output := n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1878_c21_38f4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_left;
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_return_output := BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1865_c7_2350] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1865_c7_2350_cond <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_cond;
     t16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue;
     t16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output := t16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_f498] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_f498] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_38f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_2350] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;

     -- MUX[uxn_opcodes_h_l1878_c21_a69b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1878_c21_a69b_cond <= VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_cond;
     MUX_uxn_opcodes_h_l1878_c21_a69b_iftrue <= VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_iftrue;
     MUX_uxn_opcodes_h_l1878_c21_a69b_iffalse <= VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_return_output := MUX_uxn_opcodes_h_l1878_c21_a69b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1860_c7_e11d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond;
     t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue;
     t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output := t16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_2350] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_2350] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_2350] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;

     -- n16_MUX[uxn_opcodes_h_l1869_c7_f498] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1869_c7_f498_cond <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_cond;
     n16_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue;
     n16_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_return_output := n16_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue := VAR_MUX_uxn_opcodes_h_l1878_c21_a69b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_e11d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_e11d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1865_c7_2350] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1865_c7_2350_cond <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_cond;
     n16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue;
     n16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output := n16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_e11d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1857_c7_cff6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond;
     t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue;
     t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output := t16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_2cf1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_e11d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_2cf1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;
     -- n16_MUX[uxn_opcodes_h_l1860_c7_e11d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_cond;
     n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue;
     n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output := n16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_cff6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_cff6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_f498] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_return_output := result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_cff6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := t16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_cff6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_f498_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_2350] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_return_output := result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;

     -- n16_MUX[uxn_opcodes_h_l1857_c7_cff6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_cond;
     n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue;
     n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output := n16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_2350_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_e11d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := n16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_e11d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_cff6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_cff6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_62ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1840_l1882_DUPLICATE_ca00 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1840_l1882_DUPLICATE_ca00_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_62ae_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1840_l1882_DUPLICATE_ca00_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1840_l1882_DUPLICATE_ca00_return_output;
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
