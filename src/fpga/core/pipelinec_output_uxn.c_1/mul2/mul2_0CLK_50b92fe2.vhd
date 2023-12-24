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
entity mul2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_50b92fe2;
architecture arch of mul2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_51ea]
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_d484]
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_d484]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_d484]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_d484]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_d484]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_d484]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_d484]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_d484]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_d484]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2004_c2_d484]
signal n16_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2004_c2_d484]
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2004_c2_d484]
signal t16_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_cad1]
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_d3dc]
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_d3dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_d3dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_d3dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_d3dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2017_c7_d3dc]
signal n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2017_c7_d3dc]
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2017_c7_d3dc]
signal t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_b017]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_5374]
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_5374]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_5374]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_5374]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_5374]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2020_c7_5374]
signal n16_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2020_c7_5374]
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2020_c7_5374]
signal t16_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_3dff]
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_d5ad]
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_d5ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_d5ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_d5ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_d5ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2025_c7_d5ad]
signal n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2025_c7_d5ad]
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2025_c7_d5ad]
signal t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2026_c3_bb2f]
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_45dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_dc0e]
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_dc0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_dc0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_dc0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_dc0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2029_c7_dc0e]
signal n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2029_c7_dc0e]
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_38e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_da94]
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_da94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_da94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_da94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_da94]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2033_c7_da94]
signal n16_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2033_c7_da94]
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2034_c3_e284]
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_1b7f]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2036_c30_9484]
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_cacd]
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_6213]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_6213]
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_6213]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_6213]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2044_c31_f892]
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_left,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_right,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- n16_MUX_uxn_opcodes_h_l2004_c2_d484
n16_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
n16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
n16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
n16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2004_c2_d484
tmp16_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- t16_MUX_uxn_opcodes_h_l2004_c2_d484
t16_MUX_uxn_opcodes_h_l2004_c2_d484 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2004_c2_d484_cond,
t16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue,
t16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse,
t16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_left,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_right,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output);

-- n16_MUX_uxn_opcodes_h_l2017_c7_d3dc
n16_MUX_uxn_opcodes_h_l2017_c7_d3dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond,
n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue,
n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse,
n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc
tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond,
tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output);

-- t16_MUX_uxn_opcodes_h_l2017_c7_d3dc
t16_MUX_uxn_opcodes_h_l2017_c7_d3dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond,
t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue,
t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse,
t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_cond,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_return_output);

-- n16_MUX_uxn_opcodes_h_l2020_c7_5374
n16_MUX_uxn_opcodes_h_l2020_c7_5374 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2020_c7_5374_cond,
n16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue,
n16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse,
n16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2020_c7_5374
tmp16_MUX_uxn_opcodes_h_l2020_c7_5374 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_cond,
tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue,
tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse,
tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output);

-- t16_MUX_uxn_opcodes_h_l2020_c7_5374
t16_MUX_uxn_opcodes_h_l2020_c7_5374 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2020_c7_5374_cond,
t16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue,
t16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse,
t16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_left,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_right,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output);

-- n16_MUX_uxn_opcodes_h_l2025_c7_d5ad
n16_MUX_uxn_opcodes_h_l2025_c7_d5ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond,
n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue,
n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse,
n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad
tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond,
tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue,
tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse,
tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output);

-- t16_MUX_uxn_opcodes_h_l2025_c7_d5ad
t16_MUX_uxn_opcodes_h_l2025_c7_d5ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond,
t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue,
t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse,
t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f
BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_left,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_right,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output);

-- n16_MUX_uxn_opcodes_h_l2029_c7_dc0e
n16_MUX_uxn_opcodes_h_l2029_c7_dc0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond,
n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue,
n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse,
n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e
tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond,
tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_cond,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_return_output);

-- n16_MUX_uxn_opcodes_h_l2033_c7_da94
n16_MUX_uxn_opcodes_h_l2033_c7_da94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2033_c7_da94_cond,
n16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue,
n16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse,
n16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2033_c7_da94
tmp16_MUX_uxn_opcodes_h_l2033_c7_da94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_cond,
tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue,
tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse,
tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284
BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_left,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_right,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2036_c30_9484
sp_relative_shift_uxn_opcodes_h_l2036_c30_9484 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_ins,
sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_x,
sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_y,
sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_left,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_right,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_cond,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2044_c31_f892
CONST_SR_8_uxn_opcodes_h_l2044_c31_f892 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_x,
CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4
CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 n16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 t16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output,
 n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output,
 t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_return_output,
 n16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output,
 tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output,
 t16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output,
 n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output,
 tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output,
 t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output,
 n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_return_output,
 n16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output,
 tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_return_output,
 CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_a857 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_127d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_0dd7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_c0d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_006e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_8d19 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2035_c3_bb76 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_aa37_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_c1c2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_4aff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_0ff6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_f81f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_383e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_3bff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_b89f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2034_l2026_l2030_DUPLICATE_3fef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_5f80_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2048_l2000_DUPLICATE_183f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_c1c2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_c1c2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_4aff := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_4aff;
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_8d19 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_8d19;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_0dd7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_0dd7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_127d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_127d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_a857 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_a857;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_c0d8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_c0d8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_006e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_006e;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_38e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_f81f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_f81f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_b017] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_b89f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_b89f_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2044_c31_f892] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_return_output := CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2034_l2026_l2030_DUPLICATE_3fef LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2034_l2026_l2030_DUPLICATE_3fef_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_cacd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_d484_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2036_c30_9484] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_ins;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_x;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_return_output := sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_383e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_383e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_51ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_cad1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_d484_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_3dff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_45dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_d484_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_d484_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_5f80 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_5f80_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_3bff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_3bff_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_51ea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cad1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b017_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_3dff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_45dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_38e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_cacd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2034_l2026_l2030_DUPLICATE_3fef_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2034_l2026_l2030_DUPLICATE_3fef_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2034_l2026_l2030_DUPLICATE_3fef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_383e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_383e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_383e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_383e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_3bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_3bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_3bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_3bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_3bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_3bff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_b89f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_b89f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_b89f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_b89f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_b89f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_5f80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_5f80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_f81f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_f81f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_f81f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_f81f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_f81f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_f81f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_d484_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_d484_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_d484_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_d484_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_9484_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_6213] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2034_c3_e284] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_left;
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_return_output := BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2026_c3_bb2f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_left;
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_return_output := BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2044_c21_0ff6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_0ff6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_f892_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_6213] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_6213] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_da94] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_bb2f_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_e284_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_0ff6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_e5c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_6213_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_6213_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_6213_return_output;
     -- t16_MUX[uxn_opcodes_h_l2025_c7_d5ad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond;
     t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue;
     t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output := t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;

     -- n16_MUX[uxn_opcodes_h_l2033_c7_da94] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2033_c7_da94_cond <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_cond;
     n16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue;
     n16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output := n16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_da94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_6213] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_return_output := result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_da94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_da94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_1b7f] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_dc0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2035_c3_bb76 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_1b7f_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_6213_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue := VAR_tmp16_uxn_opcodes_h_l2035_c3_bb76;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_dc0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_dc0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2033_c7_da94] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_cond;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output := tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_d5ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;

     -- t16_MUX[uxn_opcodes_h_l2020_c7_5374] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2020_c7_5374_cond <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_cond;
     t16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue;
     t16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output := t16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2039_c21_aa37] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_aa37_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2035_c3_bb76);

     -- n16_MUX[uxn_opcodes_h_l2029_c7_dc0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond;
     n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue;
     n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output := n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_dc0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_aa37_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_d5ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;

     -- n16_MUX[uxn_opcodes_h_l2025_c7_d5ad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond;
     n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue;
     n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output := n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;

     -- t16_MUX[uxn_opcodes_h_l2017_c7_d3dc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond;
     t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue;
     t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output := t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_d5ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_5374] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_da94] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_return_output := result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2029_c7_dc0e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output := tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_d5ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_da94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_d3dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_5374] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;

     -- n16_MUX[uxn_opcodes_h_l2020_c7_5374] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2020_c7_5374_cond <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_cond;
     n16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue;
     n16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output := n16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_5374] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2025_c7_d5ad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output := tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_dc0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_5374] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;

     -- t16_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     t16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     t16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := t16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_dc0e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_d3dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2020_c7_5374] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_cond;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output := tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_d3dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2017_c7_d3dc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond;
     n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue;
     n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output := n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_d3dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_d5ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_d5ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_5374] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_return_output := result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- n16_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     n16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     n16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := n16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2017_c7_d3dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output := tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_5374_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_d3dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_d3dc_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_d484] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_return_output := result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2048_l2000_DUPLICATE_183f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2048_l2000_DUPLICATE_183f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_d484_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2048_l2000_DUPLICATE_183f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2048_l2000_DUPLICATE_183f_return_output;
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
