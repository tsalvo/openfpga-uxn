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
-- BIN_OP_EQ[uxn_opcodes_h_l1867_c6_414c]
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1867_c2_eb6a]
signal n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1880_c11_67e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1880_c7_7d3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1880_c7_7d3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1880_c7_7d3e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1880_c7_7d3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1880_c7_7d3e]
signal result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1880_c7_7d3e]
signal t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1880_c7_7d3e]
signal n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_fc28]
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c7_6469]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1883_c7_6469]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1883_c7_6469]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_6469]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1883_c7_6469]
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1883_c7_6469]
signal t16_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1883_c7_6469]
signal n16_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1888_c11_0050]
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1888_c7_7137]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1888_c7_7137]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1888_c7_7137]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1888_c7_7137]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1888_c7_7137]
signal result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1888_c7_7137]
signal t16_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1888_c7_7137]
signal n16_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1889_c3_08e6]
signal BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1892_c11_7f25]
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1892_c7_60d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1892_c7_60d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1892_c7_60d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1892_c7_60d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1892_c7_60d2]
signal result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1892_c7_60d2]
signal n16_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_62fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c7_80ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1896_c7_80ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1896_c7_80ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c7_80ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1896_c7_80ea]
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1896_c7_80ea]
signal n16_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1897_c3_eff5]
signal BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1898_c30_c7dc]
signal sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1901_c21_12a8]
signal BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1901_c21_b637]
signal MUX_uxn_opcodes_h_l1901_c21_b637_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1901_c21_b637_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1901_c21_b637_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1901_c21_b637_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_left,
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_right,
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a
result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a
result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a
result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- t16_MUX_uxn_opcodes_h_l1867_c2_eb6a
t16_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- n16_MUX_uxn_opcodes_h_l1867_c2_eb6a
n16_MUX_uxn_opcodes_h_l1867_c2_eb6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond,
n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue,
n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse,
n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e
result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e
result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e
result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output);

-- t16_MUX_uxn_opcodes_h_l1880_c7_7d3e
t16_MUX_uxn_opcodes_h_l1880_c7_7d3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond,
t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue,
t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse,
t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output);

-- n16_MUX_uxn_opcodes_h_l1880_c7_7d3e
n16_MUX_uxn_opcodes_h_l1880_c7_7d3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond,
n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue,
n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse,
n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_left,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_right,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_cond,
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_return_output);

-- t16_MUX_uxn_opcodes_h_l1883_c7_6469
t16_MUX_uxn_opcodes_h_l1883_c7_6469 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1883_c7_6469_cond,
t16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue,
t16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse,
t16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output);

-- n16_MUX_uxn_opcodes_h_l1883_c7_6469
n16_MUX_uxn_opcodes_h_l1883_c7_6469 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1883_c7_6469_cond,
n16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue,
n16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse,
n16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_left,
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_right,
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137
result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_cond,
result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_return_output);

-- t16_MUX_uxn_opcodes_h_l1888_c7_7137
t16_MUX_uxn_opcodes_h_l1888_c7_7137 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1888_c7_7137_cond,
t16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue,
t16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse,
t16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output);

-- n16_MUX_uxn_opcodes_h_l1888_c7_7137
n16_MUX_uxn_opcodes_h_l1888_c7_7137 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1888_c7_7137_cond,
n16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue,
n16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse,
n16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6
BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_left,
BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_right,
BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_left,
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_right,
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2
result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output);

-- n16_MUX_uxn_opcodes_h_l1892_c7_60d2
n16_MUX_uxn_opcodes_h_l1892_c7_60d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1892_c7_60d2_cond,
n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue,
n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse,
n16_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_cond,
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output);

-- n16_MUX_uxn_opcodes_h_l1896_c7_80ea
n16_MUX_uxn_opcodes_h_l1896_c7_80ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1896_c7_80ea_cond,
n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue,
n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse,
n16_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5
BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_left,
BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_right,
BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc
sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_ins,
sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_x,
sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_y,
sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8
BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_left,
BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_right,
BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_return_output);

-- MUX_uxn_opcodes_h_l1901_c21_b637
MUX_uxn_opcodes_h_l1901_c21_b637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1901_c21_b637_cond,
MUX_uxn_opcodes_h_l1901_c21_b637_iftrue,
MUX_uxn_opcodes_h_l1901_c21_b637_iffalse,
MUX_uxn_opcodes_h_l1901_c21_b637_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd
CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output,
 t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output,
 n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_return_output,
 t16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output,
 n16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_return_output,
 t16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output,
 n16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output,
 n16_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output,
 n16_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_return_output,
 sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_return_output,
 MUX_uxn_opcodes_h_l1901_c21_b637_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1872_c3_f621 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_0bc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_3af6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_8086 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_4564 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_9f47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1901_c21_b637_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1901_c21_b637_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1901_c21_b637_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1901_c21_b637_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1888_l1883_l1867_l1880_l1892_l1896_DUPLICATE_f885_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_3296_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_e1f6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_71fb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_5bc3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1892_l1896_DUPLICATE_71ea_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1905_l1863_DUPLICATE_c0a5_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_0bc1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_0bc1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_4564 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_4564;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_8086 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_8086;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l1901_c21_b637_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1901_c21_b637_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1872_c3_f621 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1872_c3_f621;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_3af6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_3af6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_9f47 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_9f47;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse := t16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1888_c11_0050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_left;
     BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output := BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1880_c11_67e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_71fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_71fb_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_5bc3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_5bc3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1888_l1883_l1867_l1880_l1892_l1896_DUPLICATE_f885 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1888_l1883_l1867_l1880_l1892_l1896_DUPLICATE_f885_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_fc28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_3296 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_3296_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1892_c11_7f25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_left;
     BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output := BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1867_c6_414c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_e1f6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_e1f6_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1898_c30_c7dc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_ins;
     sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_x;
     sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_return_output := sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_62fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1892_l1896_DUPLICATE_71ea LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1892_l1896_DUPLICATE_71ea_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_414c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_67e0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_fc28_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_0050_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7f25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_62fb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_5bc3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_5bc3_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_5bc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_e1f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_e1f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_e1f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_e1f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_e1f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_71fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_71fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_71fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_71fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_71fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_3296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_3296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_3296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_3296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1888_l1883_l1880_l1892_l1896_DUPLICATE_3296_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1892_l1896_DUPLICATE_71ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1892_l1896_DUPLICATE_71ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1888_l1883_l1867_l1880_l1892_l1896_DUPLICATE_f885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1888_l1883_l1867_l1880_l1892_l1896_DUPLICATE_f885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1888_l1883_l1867_l1880_l1892_l1896_DUPLICATE_f885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1888_l1883_l1867_l1880_l1892_l1896_DUPLICATE_f885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1888_l1883_l1867_l1880_l1892_l1896_DUPLICATE_f885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1888_l1883_l1867_l1880_l1892_l1896_DUPLICATE_f885_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1867_c2_eb6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_c7dc_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1889_c3_08e6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_left;
     BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_return_output := BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c7_80ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1896_c7_80ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1897_c3_eff5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_left;
     BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_return_output := BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c7_80ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1896_c7_80ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_08e6_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_eff5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_e0fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;
     -- n16_MUX[uxn_opcodes_h_l1896_c7_80ea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1896_c7_80ea_cond <= VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_cond;
     n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue;
     n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output := n16_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1892_c7_60d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1892_c7_60d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1901_c21_12a8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_left;
     BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_return_output := BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1892_c7_60d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1892_c7_60d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1888_c7_7137] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1888_c7_7137_cond <= VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_cond;
     t16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue;
     t16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output := t16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1901_c21_b637_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_12a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1888_c7_7137] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;

     -- n16_MUX[uxn_opcodes_h_l1892_c7_60d2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1892_c7_60d2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_cond;
     n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue;
     n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output := n16_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;

     -- MUX[uxn_opcodes_h_l1901_c21_b637] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1901_c21_b637_cond <= VAR_MUX_uxn_opcodes_h_l1901_c21_b637_cond;
     MUX_uxn_opcodes_h_l1901_c21_b637_iftrue <= VAR_MUX_uxn_opcodes_h_l1901_c21_b637_iftrue;
     MUX_uxn_opcodes_h_l1901_c21_b637_iffalse <= VAR_MUX_uxn_opcodes_h_l1901_c21_b637_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1901_c21_b637_return_output := MUX_uxn_opcodes_h_l1901_c21_b637_return_output;

     -- t16_MUX[uxn_opcodes_h_l1883_c7_6469] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1883_c7_6469_cond <= VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_cond;
     t16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue;
     t16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output := t16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1888_c7_7137] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1888_c7_7137] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1888_c7_7137] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue := VAR_MUX_uxn_opcodes_h_l1901_c21_b637_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;
     -- n16_MUX[uxn_opcodes_h_l1888_c7_7137] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1888_c7_7137_cond <= VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_cond;
     n16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue;
     n16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output := n16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1896_c7_80ea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output := result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1883_c7_6469] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1883_c7_6469] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c7_6469] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_6469] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;

     -- t16_MUX[uxn_opcodes_h_l1880_c7_7d3e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond;
     t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue;
     t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output := t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_80ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1880_c7_7d3e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1892_c7_60d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1880_c7_7d3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1880_c7_7d3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1880_c7_7d3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1883_c7_6469] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1883_c7_6469_cond <= VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_cond;
     n16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue;
     n16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output := n16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_60d2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1880_c7_7d3e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond;
     n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue;
     n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output := n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1888_c7_7137] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_return_output := result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_7137_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1883_c7_6469] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_return_output := result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;

     -- n16_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_6469_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1880_c7_7d3e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_7d3e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1867_c2_eb6a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1905_l1863_DUPLICATE_c0a5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1905_l1863_DUPLICATE_c0a5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_eb6a_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1905_l1863_DUPLICATE_c0a5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1905_l1863_DUPLICATE_c0a5_return_output;
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
