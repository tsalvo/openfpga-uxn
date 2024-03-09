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
-- BIN_OP_EQ[uxn_opcodes_h_l2005_c6_7fcc]
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c2_9e6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_9def]
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2018_c7_649c]
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2018_c7_649c]
signal n16_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2018_c7_649c]
signal t16_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2018_c7_649c]
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2018_c7_649c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2018_c7_649c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2018_c7_649c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2018_c7_649c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_2cca]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2021_c7_f766]
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2021_c7_f766]
signal n16_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2021_c7_f766]
signal t16_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2021_c7_f766]
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_f766]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_f766]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_f766]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_f766]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_1bab]
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2026_c7_d454]
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2026_c7_d454]
signal n16_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2026_c7_d454]
signal t16_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2026_c7_d454]
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2026_c7_d454]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2026_c7_d454]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2026_c7_d454]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2026_c7_d454]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2027_c3_2015]
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_048d]
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2030_c7_ecf6]
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2030_c7_ecf6]
signal n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2030_c7_ecf6]
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2030_c7_ecf6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2030_c7_ecf6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2030_c7_ecf6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2030_c7_ecf6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_8981]
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2034_c7_2f52]
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2034_c7_2f52]
signal n16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_2f52]
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_2f52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_2f52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_2f52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_2f52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2035_c3_17d3]
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2036_c11_4b5a]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2037_c30_4512]
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_5433]
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_d217]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_d217]
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_d217]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_d217]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2045_c31_b95e]
signal CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_left,
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_right,
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d
tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- n16_MUX_uxn_opcodes_h_l2005_c2_9e6d
n16_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- t16_MUX_uxn_opcodes_h_l2005_c2_9e6d
t16_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_left,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_right,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2018_c7_649c
tmp16_MUX_uxn_opcodes_h_l2018_c7_649c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_cond,
tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output);

-- n16_MUX_uxn_opcodes_h_l2018_c7_649c
n16_MUX_uxn_opcodes_h_l2018_c7_649c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2018_c7_649c_cond,
n16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue,
n16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse,
n16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output);

-- t16_MUX_uxn_opcodes_h_l2018_c7_649c
t16_MUX_uxn_opcodes_h_l2018_c7_649c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2018_c7_649c_cond,
t16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue,
t16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse,
t16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2021_c7_f766
tmp16_MUX_uxn_opcodes_h_l2021_c7_f766 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_cond,
tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue,
tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse,
tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output);

-- n16_MUX_uxn_opcodes_h_l2021_c7_f766
n16_MUX_uxn_opcodes_h_l2021_c7_f766 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2021_c7_f766_cond,
n16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue,
n16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse,
n16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output);

-- t16_MUX_uxn_opcodes_h_l2021_c7_f766
t16_MUX_uxn_opcodes_h_l2021_c7_f766 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2021_c7_f766_cond,
t16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue,
t16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse,
t16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_cond,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_left,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_right,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2026_c7_d454
tmp16_MUX_uxn_opcodes_h_l2026_c7_d454 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_cond,
tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue,
tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse,
tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output);

-- n16_MUX_uxn_opcodes_h_l2026_c7_d454
n16_MUX_uxn_opcodes_h_l2026_c7_d454 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2026_c7_d454_cond,
n16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue,
n16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse,
n16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output);

-- t16_MUX_uxn_opcodes_h_l2026_c7_d454
t16_MUX_uxn_opcodes_h_l2026_c7_d454 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2026_c7_d454_cond,
t16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue,
t16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse,
t16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_cond,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015
BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_left,
BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_right,
BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_left,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_right,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6
tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond,
tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output);

-- n16_MUX_uxn_opcodes_h_l2030_c7_ecf6
n16_MUX_uxn_opcodes_h_l2030_c7_ecf6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond,
n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue,
n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse,
n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_left,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_right,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52
tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond,
tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue,
tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse,
tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output);

-- n16_MUX_uxn_opcodes_h_l2034_c7_2f52
n16_MUX_uxn_opcodes_h_l2034_c7_2f52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond,
n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue,
n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse,
n16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_cond,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3
BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_left,
BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_right,
BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2037_c30_4512
sp_relative_shift_uxn_opcodes_h_l2037_c30_4512 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_ins,
sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_x,
sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_y,
sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_left,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_right,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_cond,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e
CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_x,
CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output,
 tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output,
 n16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output,
 t16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output,
 tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output,
 n16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output,
 t16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output,
 tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output,
 n16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output,
 t16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output,
 n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output,
 tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output,
 n16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_return_output,
 CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_efd5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_cf1b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_e505 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_2f05 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_a429 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2036_c3_794f : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_e901 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_db94_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_320b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_6745 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_d1ad_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2005_l2042_DUPLICATE_87b8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_l2034_DUPLICATE_be18_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2034_DUPLICATE_66ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_DUPLICATE_0a7b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2022_l2035_DUPLICATE_478e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_875a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2049_l2001_DUPLICATE_012a_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_e901 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_e901;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_a429 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_a429;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_efd5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_efd5;
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_e505 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_e505;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_320b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_320b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_cf1b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_cf1b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_2f05 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_2f05;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_6745 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_6745;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2034_DUPLICATE_66ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2034_DUPLICATE_66ce_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_5433] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_left;
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_return_output := BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2005_c6_7fcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_1bab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2022_l2035_DUPLICATE_478e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2022_l2035_DUPLICATE_478e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2037_c30_4512] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_ins;
     sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_x;
     sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_return_output := sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_8981] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_left;
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output := BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_875a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_875a_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2045_c31_b95e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_return_output := CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_l2034_DUPLICATE_be18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_l2034_DUPLICATE_be18_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_2cca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_9def] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_left;
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output := BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2005_l2042_DUPLICATE_87b8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2005_l2042_DUPLICATE_87b8_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_DUPLICATE_0a7b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_DUPLICATE_0a7b_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_048d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_7fcc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_9def_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_2cca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_1bab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_048d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8981_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_5433_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2022_l2035_DUPLICATE_478e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2022_l2035_DUPLICATE_478e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2022_l2035_DUPLICATE_478e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_DUPLICATE_0a7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_DUPLICATE_0a7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_DUPLICATE_0a7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_DUPLICATE_0a7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_DUPLICATE_0a7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_l2034_DUPLICATE_be18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_l2034_DUPLICATE_be18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_l2034_DUPLICATE_be18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_l2034_DUPLICATE_be18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_l2034_DUPLICATE_be18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2042_l2034_DUPLICATE_be18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2034_DUPLICATE_66ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2034_DUPLICATE_66ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2034_DUPLICATE_66ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2034_DUPLICATE_66ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2034_DUPLICATE_66ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_875a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_875a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2005_l2042_DUPLICATE_87b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2005_l2042_DUPLICATE_87b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2005_l2042_DUPLICATE_87b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2005_l2042_DUPLICATE_87b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2005_l2042_DUPLICATE_87b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2030_l2026_l2021_l2018_l2005_l2042_DUPLICATE_87b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_9e6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_4512_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_d217] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_d217] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_2f52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2035_c3_17d3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_left;
     BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_return_output := BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2045_c21_d1ad] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_d1ad_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b95e_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_d217] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2027_c3_2015] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_left;
     BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_return_output := BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_2015_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_17d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_d1ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_fb6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_d217_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_d217_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_d217_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_2f52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2036_c11_4b5a] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2034_c7_2f52] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond;
     n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue;
     n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output := n16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_d217] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_return_output := result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_2f52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_2f52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;

     -- t16_MUX[uxn_opcodes_h_l2026_c7_d454] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2026_c7_d454_cond <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_cond;
     t16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue;
     t16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output := t16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2030_c7_ecf6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2036_c3_794f := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_4b5a_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_d217_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue := VAR_tmp16_uxn_opcodes_h_l2036_c3_794f;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2030_c7_ecf6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2026_c7_d454] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;

     -- n16_MUX[uxn_opcodes_h_l2030_c7_ecf6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond;
     n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue;
     n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output := n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2021_c7_f766] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2021_c7_f766_cond <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_cond;
     t16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue;
     t16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output := t16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2030_c7_ecf6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2030_c7_ecf6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2034_c7_2f52] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_cond;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output := tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2040_c21_db94] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_db94_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2036_c3_794f);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_db94_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_f766] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2026_c7_d454] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;

     -- n16_MUX[uxn_opcodes_h_l2026_c7_d454] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2026_c7_d454_cond <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_cond;
     n16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue;
     n16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output := n16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2026_c7_d454] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_2f52] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output := result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2030_c7_ecf6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond;
     tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output := tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2018_c7_649c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2018_c7_649c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_cond;
     t16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue;
     t16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output := t16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2026_c7_d454] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_2f52_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2026_c7_d454] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_cond;
     tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output := tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;

     -- n16_MUX[uxn_opcodes_h_l2021_c7_f766] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2021_c7_f766_cond <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_cond;
     n16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue;
     n16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output := n16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;

     -- t16_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_f766] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2030_c7_ecf6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2018_c7_649c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_f766] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_f766] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_ecf6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;
     -- n16_MUX[uxn_opcodes_h_l2018_c7_649c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2018_c7_649c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_cond;
     n16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue;
     n16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output := n16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2021_c7_f766] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_cond;
     tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output := tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2018_c7_649c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2018_c7_649c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2026_c7_d454] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_return_output := result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2018_c7_649c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_d454_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2021_c7_f766] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_return_output := result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;

     -- n16_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2018_c7_649c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_cond;
     tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output := tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_f766_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2018_c7_649c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_649c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2005_c2_9e6d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2049_l2001_DUPLICATE_012a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2049_l2001_DUPLICATE_012a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_9e6d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2049_l2001_DUPLICATE_012a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2049_l2001_DUPLICATE_012a_return_output;
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
