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
-- BIN_OP_EQ[uxn_opcodes_h_l853_c6_308f]
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l853_c2_cf93]
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_cf93]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_cf93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_cf93]
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_cf93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_cf93]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_cf93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_cf93]
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_cf93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l853_c2_cf93]
signal n16_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l853_c2_cf93]
signal tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l853_c2_cf93]
signal t16_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l866_c11_907c]
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l866_c7_1f58]
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_1f58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_1f58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_1f58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_1f58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l866_c7_1f58]
signal n16_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l866_c7_1f58]
signal tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l866_c7_1f58]
signal t16_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l869_c11_fdaf]
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l869_c7_dda2]
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_dda2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_dda2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_dda2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_dda2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l869_c7_dda2]
signal n16_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l869_c7_dda2]
signal tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l869_c7_dda2]
signal t16_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l874_c11_151d]
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l874_c7_5119]
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_5119]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_5119]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_5119]
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_5119]
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l874_c7_5119]
signal n16_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l874_c7_5119]
signal tmp16_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l874_c7_5119]
signal t16_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l875_c3_3a27]
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l878_c11_af64]
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l878_c7_6ca4]
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_6ca4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_6ca4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_6ca4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_6ca4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l878_c7_6ca4]
signal n16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l878_c7_6ca4]
signal tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_9164]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l882_c7_cdfb]
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_cdfb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_cdfb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_cdfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_cdfb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l882_c7_cdfb]
signal n16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l882_c7_cdfb]
signal tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l883_c3_1459]
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_2fd2]
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l885_c30_555b]
signal sp_relative_shift_uxn_opcodes_h_l885_c30_555b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_555b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_555b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_555b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l890_c11_87c0]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_e104]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l890_c7_e104]
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_e104]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_e104]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l893_c31_40d8]
signal CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f
BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_left,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_right,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93
result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- n16_MUX_uxn_opcodes_h_l853_c2_cf93
n16_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
n16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
n16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
n16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- tmp16_MUX_uxn_opcodes_h_l853_c2_cf93
tmp16_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- t16_MUX_uxn_opcodes_h_l853_c2_cf93
t16_MUX_uxn_opcodes_h_l853_c2_cf93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l853_c2_cf93_cond,
t16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue,
t16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse,
t16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c
BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_left,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_right,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58
result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_cond,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_return_output);

-- n16_MUX_uxn_opcodes_h_l866_c7_1f58
n16_MUX_uxn_opcodes_h_l866_c7_1f58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l866_c7_1f58_cond,
n16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue,
n16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse,
n16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output);

-- tmp16_MUX_uxn_opcodes_h_l866_c7_1f58
tmp16_MUX_uxn_opcodes_h_l866_c7_1f58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_cond,
tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue,
tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse,
tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output);

-- t16_MUX_uxn_opcodes_h_l866_c7_1f58
t16_MUX_uxn_opcodes_h_l866_c7_1f58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l866_c7_1f58_cond,
t16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue,
t16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse,
t16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf
BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_left,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_right,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2
result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_cond,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_return_output);

-- n16_MUX_uxn_opcodes_h_l869_c7_dda2
n16_MUX_uxn_opcodes_h_l869_c7_dda2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l869_c7_dda2_cond,
n16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue,
n16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse,
n16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l869_c7_dda2
tmp16_MUX_uxn_opcodes_h_l869_c7_dda2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_cond,
tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue,
tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse,
tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output);

-- t16_MUX_uxn_opcodes_h_l869_c7_dda2
t16_MUX_uxn_opcodes_h_l869_c7_dda2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l869_c7_dda2_cond,
t16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue,
t16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse,
t16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d
BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_left,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_right,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119
result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_cond,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_return_output);

-- n16_MUX_uxn_opcodes_h_l874_c7_5119
n16_MUX_uxn_opcodes_h_l874_c7_5119 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l874_c7_5119_cond,
n16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue,
n16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse,
n16_MUX_uxn_opcodes_h_l874_c7_5119_return_output);

-- tmp16_MUX_uxn_opcodes_h_l874_c7_5119
tmp16_MUX_uxn_opcodes_h_l874_c7_5119 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l874_c7_5119_cond,
tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue,
tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse,
tmp16_MUX_uxn_opcodes_h_l874_c7_5119_return_output);

-- t16_MUX_uxn_opcodes_h_l874_c7_5119
t16_MUX_uxn_opcodes_h_l874_c7_5119 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l874_c7_5119_cond,
t16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue,
t16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse,
t16_MUX_uxn_opcodes_h_l874_c7_5119_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27
BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_left,
BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_right,
BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64
BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_left,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_right,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4
result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_cond,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output);

-- n16_MUX_uxn_opcodes_h_l878_c7_6ca4
n16_MUX_uxn_opcodes_h_l878_c7_6ca4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond,
n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue,
n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse,
n16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4
tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond,
tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue,
tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse,
tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164
BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb
result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_cond,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output);

-- n16_MUX_uxn_opcodes_h_l882_c7_cdfb
n16_MUX_uxn_opcodes_h_l882_c7_cdfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond,
n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue,
n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse,
n16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb
tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond,
tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue,
tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse,
tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l883_c3_1459
BIN_OP_OR_uxn_opcodes_h_l883_c3_1459 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_left,
BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_right,
BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_left,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_right,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l885_c30_555b
sp_relative_shift_uxn_opcodes_h_l885_c30_555b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l885_c30_555b_ins,
sp_relative_shift_uxn_opcodes_h_l885_c30_555b_x,
sp_relative_shift_uxn_opcodes_h_l885_c30_555b_y,
sp_relative_shift_uxn_opcodes_h_l885_c30_555b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0
BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104
result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_cond,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_return_output);

-- CONST_SR_8_uxn_opcodes_h_l893_c31_40d8
CONST_SR_8_uxn_opcodes_h_l893_c31_40d8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_x,
CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4
CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 n16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 t16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_return_output,
 n16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output,
 tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output,
 t16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_return_output,
 n16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output,
 tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output,
 t16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_return_output,
 n16_MUX_uxn_opcodes_h_l874_c7_5119_return_output,
 tmp16_MUX_uxn_opcodes_h_l874_c7_5119_return_output,
 t16_MUX_uxn_opcodes_h_l874_c7_5119_return_output,
 BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output,
 n16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output,
 tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output,
 n16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output,
 tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_return_output,
 sp_relative_shift_uxn_opcodes_h_l885_c30_555b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_return_output,
 CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_4536 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_8161 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_c007 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_8562 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_9ccc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_31d6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l884_c3_2d66 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_3baf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_7707 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_1c2e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_217f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_b013_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_5da2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_53ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_4a97_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_d9ce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_0ef2_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l897_l849_DUPLICATE_a1d6_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_1c2e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_1c2e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_7707 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_7707;
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_8161 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_8161;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_31d6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_31d6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_9ccc := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_9ccc;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_8562 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_8562;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_c007 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_c007;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_4536 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_4536;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse := tmp16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_cf93_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_4a97 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_4a97_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_cf93_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_b013 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_b013_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_cf93_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_53ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_53ec_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l874_c11_151d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_left;
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output := BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l893_c31_40d8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_return_output := CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_cf93_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_0ef2 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_0ef2_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_d9ce LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_d9ce_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l878_c11_af64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_left;
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output := BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l866_c11_907c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_left;
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output := BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l885_c30_555b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l885_c30_555b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_ins;
     sp_relative_shift_uxn_opcodes_h_l885_c30_555b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_x;
     sp_relative_shift_uxn_opcodes_h_l885_c30_555b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_return_output := sp_relative_shift_uxn_opcodes_h_l885_c30_555b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l869_c11_fdaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l853_c6_308f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_left;
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output := BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_9164] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_5da2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_5da2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c11_87c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_308f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_907c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_fdaf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_151d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_af64_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_87c0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_d9ce_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_d9ce_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_d9ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_5da2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_5da2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_5da2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_5da2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_5da2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_53ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_53ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_53ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_53ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_53ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_53ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_4a97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_4a97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_4a97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_4a97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_4a97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_0ef2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_0ef2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_b013_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_b013_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_b013_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_b013_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_b013_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_b013_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_cf93_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_cf93_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_cf93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_cf93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_555b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l875_c3_3a27] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_left;
     BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_return_output := BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l883_c3_1459] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_left;
     BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_return_output := BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_e104] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_e104] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_cdfb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l893_c21_217f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_217f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_40d8_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_e104] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_3a27_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_right := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_1459_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_217f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_2aa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_e104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_e104_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_e104_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_cdfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_cdfb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l890_c7_e104] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_cond;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_return_output := result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_return_output;

     -- t16_MUX[uxn_opcodes_h_l874_c7_5119] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l874_c7_5119_cond <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_cond;
     t16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue;
     t16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_return_output := t16_MUX_uxn_opcodes_h_l874_c7_5119_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_2fd2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_return_output;

     -- n16_MUX[uxn_opcodes_h_l882_c7_cdfb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond;
     n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue;
     n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output := n16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_6ca4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_cdfb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l884_c3_2d66 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_2fd2_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_e104_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l874_c7_5119_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue := VAR_tmp16_uxn_opcodes_h_l884_c3_2d66;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_5119] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_return_output;

     -- n16_MUX[uxn_opcodes_h_l878_c7_6ca4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond;
     n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue;
     n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output := n16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;

     -- t16_MUX[uxn_opcodes_h_l869_c7_dda2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l869_c7_dda2_cond <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_cond;
     t16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue;
     t16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output := t16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_6ca4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l888_c21_3baf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_3baf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l884_c3_2d66);

     -- tmp16_MUX[uxn_opcodes_h_l882_c7_cdfb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_cond;
     tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output := tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_6ca4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_6ca4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_3baf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse := VAR_n16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_5119_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse := VAR_t16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l882_c7_cdfb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output := result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_5119] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_dda2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_5119] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l878_c7_6ca4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_cond;
     tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output := tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;

     -- n16_MUX[uxn_opcodes_h_l874_c7_5119] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l874_c7_5119_cond <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_cond;
     n16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue;
     n16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_return_output := n16_MUX_uxn_opcodes_h_l874_c7_5119_return_output;

     -- t16_MUX[uxn_opcodes_h_l866_c7_1f58] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l866_c7_1f58_cond <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_cond;
     t16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue;
     t16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output := t16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_5119] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l874_c7_5119_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_5119_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_5119_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_5119_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_cdfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_t16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_dda2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_dda2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;

     -- t16_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     t16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     t16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := t16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l878_c7_6ca4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output := result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_dda2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;

     -- n16_MUX[uxn_opcodes_h_l869_c7_dda2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l869_c7_dda2_cond <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_cond;
     n16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue;
     n16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output := n16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l874_c7_5119] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l874_c7_5119_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_cond;
     tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iftrue;
     tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_return_output := tmp16_MUX_uxn_opcodes_h_l874_c7_5119_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_1f58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse := VAR_n16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_6ca4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_5119_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_1f58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_1f58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l874_c7_5119] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_cond;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_return_output := result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l869_c7_dda2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_cond;
     tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output := tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_1f58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;

     -- n16_MUX[uxn_opcodes_h_l866_c7_1f58] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l866_c7_1f58_cond <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_cond;
     n16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue;
     n16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output := n16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_n16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_5119_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l866_c7_1f58] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_cond;
     tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue;
     tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output := tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- n16_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     n16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     n16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := n16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l869_c7_dda2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_return_output := result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_dda2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l866_c7_1f58] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_cond;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_return_output := result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_1f58_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l853_c2_cf93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_return_output := result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l897_l849_DUPLICATE_a1d6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l897_l849_DUPLICATE_a1d6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_cf93_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l897_l849_DUPLICATE_a1d6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l897_l849_DUPLICATE_a1d6_return_output;
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
