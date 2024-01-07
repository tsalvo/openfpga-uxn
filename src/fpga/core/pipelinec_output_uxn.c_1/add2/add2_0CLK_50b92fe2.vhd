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
-- BIN_OP_EQ[uxn_opcodes_h_l853_c6_5f64]
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal t16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l853_c2_e5ad]
signal n16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l866_c11_c422]
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_f24c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_f24c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l866_c7_f24c]
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_f24c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_f24c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l866_c7_f24c]
signal tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l866_c7_f24c]
signal t16_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l866_c7_f24c]
signal n16_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l869_c11_973f]
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_4f8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_4f8b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l869_c7_4f8b]
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_4f8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_4f8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l869_c7_4f8b]
signal tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l869_c7_4f8b]
signal t16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l869_c7_4f8b]
signal n16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l874_c11_23e3]
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_f8ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_f8ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l874_c7_f8ac]
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_f8ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_f8ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l874_c7_f8ac]
signal tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l874_c7_f8ac]
signal t16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l874_c7_f8ac]
signal n16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l875_c3_aac7]
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l878_c11_17cd]
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_b85f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_b85f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l878_c7_b85f]
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_b85f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_b85f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l878_c7_b85f]
signal tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l878_c7_b85f]
signal n16_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_757b]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_de4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_de4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l882_c7_de4c]
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_de4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_de4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l882_c7_de4c]
signal tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l882_c7_de4c]
signal n16_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l883_c3_32b4]
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_f651]
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l885_c30_dd47]
signal sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l890_c11_5abc]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_148c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_148c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_148c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l890_c7_148c]
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l893_c31_94f0]
signal CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64
BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_left,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_right,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad
result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad
tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- t16_MUX_uxn_opcodes_h_l853_c2_e5ad
t16_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
t16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- n16_MUX_uxn_opcodes_h_l853_c2_e5ad
n16_MUX_uxn_opcodes_h_l853_c2_e5ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond,
n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue,
n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse,
n16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422
BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_left,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_right,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c
result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_cond,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l866_c7_f24c
tmp16_MUX_uxn_opcodes_h_l866_c7_f24c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_cond,
tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue,
tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse,
tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output);

-- t16_MUX_uxn_opcodes_h_l866_c7_f24c
t16_MUX_uxn_opcodes_h_l866_c7_f24c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l866_c7_f24c_cond,
t16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue,
t16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse,
t16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output);

-- n16_MUX_uxn_opcodes_h_l866_c7_f24c
n16_MUX_uxn_opcodes_h_l866_c7_f24c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l866_c7_f24c_cond,
n16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue,
n16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse,
n16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f
BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_left,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_right,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b
result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_cond,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b
tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond,
tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue,
tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse,
tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output);

-- t16_MUX_uxn_opcodes_h_l869_c7_4f8b
t16_MUX_uxn_opcodes_h_l869_c7_4f8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond,
t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue,
t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse,
t16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output);

-- n16_MUX_uxn_opcodes_h_l869_c7_4f8b
n16_MUX_uxn_opcodes_h_l869_c7_4f8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond,
n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue,
n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse,
n16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3
BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_left,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_right,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac
result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac
tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond,
tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue,
tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse,
tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output);

-- t16_MUX_uxn_opcodes_h_l874_c7_f8ac
t16_MUX_uxn_opcodes_h_l874_c7_f8ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond,
t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue,
t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse,
t16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output);

-- n16_MUX_uxn_opcodes_h_l874_c7_f8ac
n16_MUX_uxn_opcodes_h_l874_c7_f8ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond,
n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue,
n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse,
n16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7
BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_left,
BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_right,
BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd
BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_left,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_right,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f
result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_cond,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l878_c7_b85f
tmp16_MUX_uxn_opcodes_h_l878_c7_b85f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_cond,
tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue,
tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse,
tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output);

-- n16_MUX_uxn_opcodes_h_l878_c7_b85f
n16_MUX_uxn_opcodes_h_l878_c7_b85f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l878_c7_b85f_cond,
n16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue,
n16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse,
n16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b
BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c
result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_cond,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l882_c7_de4c
tmp16_MUX_uxn_opcodes_h_l882_c7_de4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_cond,
tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue,
tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse,
tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output);

-- n16_MUX_uxn_opcodes_h_l882_c7_de4c
n16_MUX_uxn_opcodes_h_l882_c7_de4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l882_c7_de4c_cond,
n16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue,
n16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse,
n16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4
BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_left,
BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_right,
BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_left,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_right,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_return_output);

-- sp_relative_shift_uxn_opcodes_h_l885_c30_dd47
sp_relative_shift_uxn_opcodes_h_l885_c30_dd47 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_ins,
sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_x,
sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_y,
sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc
BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c
result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_cond,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l893_c31_94f0
CONST_SR_8_uxn_opcodes_h_l893_c31_94f0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_x,
CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4
CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 t16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 n16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_return_output,
 tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output,
 t16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output,
 n16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output,
 tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output,
 t16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output,
 n16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output,
 tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output,
 t16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output,
 n16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output,
 BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_return_output,
 tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output,
 n16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_return_output,
 tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output,
 n16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_return_output,
 sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_return_output,
 CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_e946 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_c8aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_87f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_43a8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_f397 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_42f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l884_c3_b9f9 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_053b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_3e40 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_5ede : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_dc27_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_e79e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_e73f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_4e5d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_455f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l883_l875_l879_DUPLICATE_2ab4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l878_l890_DUPLICATE_116c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l897_l849_DUPLICATE_4bd6_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_e946 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_e946;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_87f0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_87f0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_3e40 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_3e40;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_c8aa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_c8aa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_43a8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_43a8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_42f5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_42f5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_5ede := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_5ede;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_f397 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_f397;
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l869_c11_973f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_left;
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output := BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l878_c11_17cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l874_c11_23e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c11_5abc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_757b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_e79e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_e79e_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_455f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_455f_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_e73f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_e73f_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l866_c11_c422] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_left;
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output := BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l883_l875_l879_DUPLICATE_2ab4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l883_l875_l879_DUPLICATE_2ab4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l878_l890_DUPLICATE_116c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l878_l890_DUPLICATE_116c_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_4e5d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_4e5d_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l885_c30_dd47] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_ins;
     sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_x <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_x;
     sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_y <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_return_output := sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l853_c6_5f64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_left;
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output := BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l893_c31_94f0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_return_output := CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_5f64_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_c422_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_973f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_23e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_17cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_757b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_5abc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l883_l875_l879_DUPLICATE_2ab4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l883_l875_l879_DUPLICATE_2ab4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l870_l883_l875_l879_DUPLICATE_2ab4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_e73f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_e73f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_e73f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_e73f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l874_l866_l878_l869_DUPLICATE_e73f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_455f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_455f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_455f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_455f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_455f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l890_l882_l874_l866_l878_l869_DUPLICATE_455f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_4e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_4e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_4e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_4e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l882_l874_l866_l878_l869_DUPLICATE_4e5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l878_l890_DUPLICATE_116c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l878_l890_DUPLICATE_116c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_e79e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_e79e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_e79e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_e79e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_e79e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l890_l853_l874_l866_l878_l869_DUPLICATE_e79e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_e5ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_dd47_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l875_c3_aac7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_left;
     BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_return_output := BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_148c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_148c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_148c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l883_c3_32b4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_left;
     BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_return_output := BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_de4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l893_c21_dc27] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_dc27_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_94f0_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_aac7_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_right := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_32b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_dc27_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_bbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_148c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_148c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_148c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_de4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l882_c7_de4c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l882_c7_de4c_cond <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_cond;
     n16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue;
     n16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output := n16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;

     -- t16_MUX[uxn_opcodes_h_l874_c7_f8ac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond;
     t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue;
     t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output := t16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_de4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_b85f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l890_c7_148c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_return_output := result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_f651] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_left;
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_return_output := BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_de4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l884_c3_b9f9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_f651_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_148c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue := VAR_tmp16_uxn_opcodes_h_l884_c3_b9f9;
     -- n16_MUX[uxn_opcodes_h_l878_c7_b85f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l878_c7_b85f_cond <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_cond;
     n16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue;
     n16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output := n16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_b85f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;

     -- t16_MUX[uxn_opcodes_h_l869_c7_4f8b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond;
     t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue;
     t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output := t16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_b85f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l882_c7_de4c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_cond;
     tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output := tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l888_c21_053b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_053b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l884_c3_b9f9);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_f8ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_b85f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_053b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l882_c7_de4c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_return_output := result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_4f8b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_f8ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l878_c7_b85f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_cond;
     tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output := tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_f8ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_f8ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;

     -- t16_MUX[uxn_opcodes_h_l866_c7_f24c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l866_c7_f24c_cond <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_cond;
     t16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue;
     t16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output := t16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;

     -- n16_MUX[uxn_opcodes_h_l874_c7_f8ac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond;
     n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue;
     n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output := n16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_de4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;
     -- t16_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := t16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l874_c7_f8ac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_cond;
     tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output := tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_4f8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;

     -- n16_MUX[uxn_opcodes_h_l869_c7_4f8b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond;
     n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue;
     n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output := n16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_4f8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_f24c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_4f8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l878_c7_b85f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_return_output := result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_b85f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_f24c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_f24c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_f24c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l869_c7_4f8b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_cond;
     tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output := tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l874_c7_f8ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;

     -- n16_MUX[uxn_opcodes_h_l866_c7_f24c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l866_c7_f24c_cond <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_cond;
     n16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue;
     n16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output := n16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_f8ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l866_c7_f24c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_cond;
     tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output := tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;

     -- n16_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := n16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l869_c7_4f8b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output := result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_4f8b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l866_c7_f24c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_return_output := result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_f24c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l853_c2_e5ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l897_l849_DUPLICATE_4bd6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l897_l849_DUPLICATE_4bd6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_e5ad_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l897_l849_DUPLICATE_4bd6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l897_l849_DUPLICATE_4bd6_return_output;
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
