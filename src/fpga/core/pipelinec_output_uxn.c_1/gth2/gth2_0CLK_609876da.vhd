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
entity gth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_609876da;
architecture arch of gth2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_31e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1844_c2_f170]
signal n16_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1844_c2_f170]
signal t16_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_f170]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_f170]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_f170]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_f170]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_f170]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_f170]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_f170]
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_f170]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_f170]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_37a5]
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1857_c7_d7b4]
signal n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1857_c7_d7b4]
signal t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_d7b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_d7b4]
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_d7b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_d7b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_d7b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_4c18]
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1860_c7_3ba2]
signal n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1860_c7_3ba2]
signal t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_3ba2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_3ba2]
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_3ba2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_3ba2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_3ba2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_0aa8]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1865_c7_e6b6]
signal n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1865_c7_e6b6]
signal t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_e6b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_e6b6]
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_e6b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_e6b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_e6b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1866_c3_c23c]
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_fb88]
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1869_c7_391a]
signal n16_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_391a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_391a]
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_391a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_391a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_391a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_99c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1873_c7_ba14]
signal n16_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_ba14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_ba14]
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_ba14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_ba14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_ba14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1874_c3_8179]
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1875_c30_da74]
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1878_c21_f029]
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1878_c21_e543]
signal MUX_uxn_opcodes_h_l1878_c21_e543_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_e543_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_e543_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_e543_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output);

-- n16_MUX_uxn_opcodes_h_l1844_c2_f170
n16_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
n16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
n16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
n16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- t16_MUX_uxn_opcodes_h_l1844_c2_f170
t16_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
t16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
t16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
t16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_left,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_right,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output);

-- n16_MUX_uxn_opcodes_h_l1857_c7_d7b4
n16_MUX_uxn_opcodes_h_l1857_c7_d7b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond,
n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue,
n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse,
n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output);

-- t16_MUX_uxn_opcodes_h_l1857_c7_d7b4
t16_MUX_uxn_opcodes_h_l1857_c7_d7b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond,
t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue,
t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse,
t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_left,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_right,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output);

-- n16_MUX_uxn_opcodes_h_l1860_c7_3ba2
n16_MUX_uxn_opcodes_h_l1860_c7_3ba2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond,
n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue,
n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse,
n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output);

-- t16_MUX_uxn_opcodes_h_l1860_c7_3ba2
t16_MUX_uxn_opcodes_h_l1860_c7_3ba2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond,
t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue,
t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse,
t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output);

-- n16_MUX_uxn_opcodes_h_l1865_c7_e6b6
n16_MUX_uxn_opcodes_h_l1865_c7_e6b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond,
n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue,
n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse,
n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output);

-- t16_MUX_uxn_opcodes_h_l1865_c7_e6b6
t16_MUX_uxn_opcodes_h_l1865_c7_e6b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond,
t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue,
t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse,
t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c
BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_left,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_right,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_left,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_right,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output);

-- n16_MUX_uxn_opcodes_h_l1869_c7_391a
n16_MUX_uxn_opcodes_h_l1869_c7_391a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1869_c7_391a_cond,
n16_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue,
n16_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse,
n16_MUX_uxn_opcodes_h_l1869_c7_391a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output);

-- n16_MUX_uxn_opcodes_h_l1873_c7_ba14
n16_MUX_uxn_opcodes_h_l1873_c7_ba14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1873_c7_ba14_cond,
n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue,
n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse,
n16_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_cond,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179
BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_left,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_right,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1875_c30_da74
sp_relative_shift_uxn_opcodes_h_l1875_c30_da74 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_ins,
sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_x,
sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_y,
sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029
BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_left,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_right,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_return_output);

-- MUX_uxn_opcodes_h_l1878_c21_e543
MUX_uxn_opcodes_h_l1878_c21_e543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1878_c21_e543_cond,
MUX_uxn_opcodes_h_l1878_c21_e543_iftrue,
MUX_uxn_opcodes_h_l1878_c21_e543_iffalse,
MUX_uxn_opcodes_h_l1878_c21_e543_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output,
 n16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 t16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output,
 n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output,
 t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output,
 n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output,
 t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output,
 n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output,
 t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output,
 n16_MUX_uxn_opcodes_h_l1869_c7_391a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output,
 n16_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_return_output,
 sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_return_output,
 MUX_uxn_opcodes_h_l1878_c21_e543_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_bec8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_8b51 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_e473 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_4210 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_6722 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_17c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_e543_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_e543_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_e543_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_e543_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1844_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6d50_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_60b5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_b875_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_5318_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1870_l1866_l1874_DUPLICATE_51ff_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_583e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1882_l1840_DUPLICATE_8413_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_4210 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_4210;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_17c7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_17c7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_8b51 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_8b51;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_e473 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_e473;
     VAR_MUX_uxn_opcodes_h_l1878_c21_e543_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_bec8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_bec8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_6722 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_6722;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1878_c21_e543_iftrue := resize(to_unsigned(1, 1), 8);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1870_l1866_l1874_DUPLICATE_51ff LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1870_l1866_l1874_DUPLICATE_51ff_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_60b5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_60b5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_fb88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_left;
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output := BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_b875 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_b875_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1875_c30_da74] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_ins;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_x;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_return_output := sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_583e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_583e_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_f170_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_0aa8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_f170_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_4c18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_left;
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output := BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1844_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6d50 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1844_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6d50_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_f170_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_31e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_f170_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_99c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_5318 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_5318_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_37a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_31e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_37a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_4c18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_0aa8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_fb88_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_99c4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1870_l1866_l1874_DUPLICATE_51ff_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1870_l1866_l1874_DUPLICATE_51ff_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1870_l1866_l1874_DUPLICATE_51ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_60b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_60b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_60b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_60b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_60b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_5318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_5318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_5318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_5318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_5318_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_b875_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_b875_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_b875_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_b875_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_b875_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_583e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_583e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1844_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6d50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1844_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6d50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1844_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6d50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1844_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6d50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1844_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6d50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1844_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6d50_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_f170_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_f170_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_f170_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_f170_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_da74_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1866_c3_c23c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_left;
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_return_output := BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1874_c3_8179] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_left;
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_return_output := BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_ba14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_ba14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_ba14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_ba14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_c23c_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8179_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_c588_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_391a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1878_c21_f029] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_left;
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_return_output := BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_return_output;

     -- t16_MUX[uxn_opcodes_h_l1865_c7_e6b6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond;
     t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue;
     t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output := t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_391a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1873_c7_ba14] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1873_c7_ba14_cond <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_cond;
     n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue;
     n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output := n16_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_391a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_391a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1878_c21_e543_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_f029_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;
     -- MUX[uxn_opcodes_h_l1878_c21_e543] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1878_c21_e543_cond <= VAR_MUX_uxn_opcodes_h_l1878_c21_e543_cond;
     MUX_uxn_opcodes_h_l1878_c21_e543_iftrue <= VAR_MUX_uxn_opcodes_h_l1878_c21_e543_iftrue;
     MUX_uxn_opcodes_h_l1878_c21_e543_iffalse <= VAR_MUX_uxn_opcodes_h_l1878_c21_e543_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1878_c21_e543_return_output := MUX_uxn_opcodes_h_l1878_c21_e543_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_e6b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_e6b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1869_c7_391a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1869_c7_391a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_cond;
     n16_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue;
     n16_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_return_output := n16_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1860_c7_3ba2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond;
     t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue;
     t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output := t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_e6b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_e6b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue := VAR_MUX_uxn_opcodes_h_l1878_c21_e543_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_3ba2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1865_c7_e6b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond;
     n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue;
     n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output := n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1857_c7_d7b4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond;
     t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue;
     t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output := t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_3ba2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_ba14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output := result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_3ba2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_3ba2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_ba14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_d7b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_d7b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     t16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     t16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := t16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_391a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_d7b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_d7b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1860_c7_3ba2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond;
     n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue;
     n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output := n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_391a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_e6b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- n16_MUX[uxn_opcodes_h_l1857_c7_d7b4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond;
     n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue;
     n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output := n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e6b6_return_output;
     -- n16_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     n16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     n16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := n16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_3ba2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_3ba2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_d7b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_d7b4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_f170] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_return_output := result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1882_l1840_DUPLICATE_8413 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1882_l1840_DUPLICATE_8413_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_f170_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_f170_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1882_l1840_DUPLICATE_8413_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1882_l1840_DUPLICATE_8413_return_output;
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
