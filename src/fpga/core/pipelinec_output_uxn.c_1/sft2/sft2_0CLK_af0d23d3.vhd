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
-- Submodules: 64
entity sft2_0CLK_af0d23d3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_af0d23d3;
architecture arch of sft2_0CLK_af0d23d3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_5a9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2251_c2_315e]
signal t8_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2251_c2_315e]
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_315e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_315e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_315e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_315e]
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_315e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_315e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_315e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_315e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_315e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2251_c2_315e]
signal n16_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_5420]
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2264_c7_dd18]
signal t8_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2264_c7_dd18]
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_dd18]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_dd18]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_dd18]
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_dd18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_dd18]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2264_c7_dd18]
signal n16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_c065]
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2267_c7_001d]
signal t8_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2267_c7_001d]
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_001d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_001d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_001d]
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_001d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_001d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2267_c7_001d]
signal n16_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_7ecd]
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2271_c7_e877]
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_e877]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_e877]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_e877]
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_e877]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_e877]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2271_c7_e877]
signal n16_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2273_c3_7137]
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_adf5]
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2275_c7_b69b]
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_b69b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_b69b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_b69b]
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_b69b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_b69b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2275_c7_b69b]
signal n16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2276_c3_b3a1]
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2277_c30_0fcb]
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2278_c20_a919]
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2278_c12_dfd6]
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2278_c36_cffb]
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2278_c12_4f8d]
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_bb4a]
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_60a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_60a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_60a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_60a1]
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2286_c31_18d3]
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output);

-- t8_MUX_uxn_opcodes_h_l2251_c2_315e
t8_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
t8_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
t8_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
t8_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2251_c2_315e
tmp16_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- n16_MUX_uxn_opcodes_h_l2251_c2_315e
n16_MUX_uxn_opcodes_h_l2251_c2_315e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2251_c2_315e_cond,
n16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue,
n16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse,
n16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_left,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_right,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output);

-- t8_MUX_uxn_opcodes_h_l2264_c7_dd18
t8_MUX_uxn_opcodes_h_l2264_c7_dd18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2264_c7_dd18_cond,
t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue,
t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse,
t8_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18
tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond,
tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue,
tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse,
tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_cond,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output);

-- n16_MUX_uxn_opcodes_h_l2264_c7_dd18
n16_MUX_uxn_opcodes_h_l2264_c7_dd18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond,
n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue,
n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse,
n16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_left,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_right,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output);

-- t8_MUX_uxn_opcodes_h_l2267_c7_001d
t8_MUX_uxn_opcodes_h_l2267_c7_001d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2267_c7_001d_cond,
t8_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue,
t8_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse,
t8_MUX_uxn_opcodes_h_l2267_c7_001d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2267_c7_001d
tmp16_MUX_uxn_opcodes_h_l2267_c7_001d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_cond,
tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_return_output);

-- n16_MUX_uxn_opcodes_h_l2267_c7_001d
n16_MUX_uxn_opcodes_h_l2267_c7_001d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2267_c7_001d_cond,
n16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue,
n16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse,
n16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_left,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_right,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2271_c7_e877
tmp16_MUX_uxn_opcodes_h_l2271_c7_e877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_cond,
tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue,
tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse,
tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_cond,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_return_output);

-- n16_MUX_uxn_opcodes_h_l2271_c7_e877
n16_MUX_uxn_opcodes_h_l2271_c7_e877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2271_c7_e877_cond,
n16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue,
n16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse,
n16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2273_c3_7137
CONST_SL_8_uxn_opcodes_h_l2273_c3_7137 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_x,
CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_left,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_right,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b
tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond,
tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output);

-- n16_MUX_uxn_opcodes_h_l2275_c7_b69b
n16_MUX_uxn_opcodes_h_l2275_c7_b69b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond,
n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue,
n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse,
n16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1
BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_left,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_right,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb
sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_ins,
sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_x,
sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_y,
sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919
BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_left,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_right,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6
BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_9f3d501a port map (
BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_left,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_right,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb
CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_x,
CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d
BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_4b371565 port map (
BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_left,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_right,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_left,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_right,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3
CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_x,
CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output,
 t8_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 n16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output,
 t8_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output,
 tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output,
 n16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output,
 t8_MUX_uxn_opcodes_h_l2267_c7_001d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_return_output,
 n16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_return_output,
 n16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output,
 CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output,
 n16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_return_output,
 sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_return_output,
 CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output,
 CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_e371 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_8fad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_5315 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_6212 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_96b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_5be1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_aea9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_771f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_a7f3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2251_l2283_l2271_l2267_l2264_DUPLICATE_a8b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_31e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_6002_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_d78f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_e068_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_d2e8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2246_l2290_DUPLICATE_0749_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_5315 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_5315;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_771f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_771f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_96b1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_96b1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_e371 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_e371;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_6212 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_6212;
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_aea9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_aea9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_8fad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_8fad;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_right := to_unsigned(15, 8);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_e068 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_e068_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_adf5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_31e4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_31e4_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_c065] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_left;
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output := BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_315e_return_output := result.is_vram_write;

     -- CONST_SR_4[uxn_opcodes_h_l2278_c36_cffb] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_return_output := CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2286_c31_18d3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_return_output := CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2251_l2283_l2271_l2267_l2264_DUPLICATE_a8b4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2251_l2283_l2271_l2267_l2264_DUPLICATE_a8b4_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_d2e8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_d2e8_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_315e_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_315e_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_315e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_AND[uxn_opcodes_h_l2278_c20_a919] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_left;
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_return_output := BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_6002 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_6002_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_d78f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_d78f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_5420] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_left;
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output := BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_bb4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_5a9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_7ecd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2277_c30_0fcb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_ins;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_x;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_return_output := sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_a919_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_5a9f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_5420_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_c065_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_7ecd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_adf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_bb4a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_e068_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_e068_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_6002_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_6002_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_6002_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_6002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_d78f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_d78f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_d78f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_d78f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_d78f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_31e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_31e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_31e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_31e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_d2e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_d2e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2251_l2283_l2271_l2267_l2264_DUPLICATE_a8b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2251_l2283_l2271_l2267_l2264_DUPLICATE_a8b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2251_l2283_l2271_l2267_l2264_DUPLICATE_a8b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2251_l2283_l2271_l2267_l2264_DUPLICATE_a8b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2251_l2283_l2271_l2267_l2264_DUPLICATE_a8b4_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_right := VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_cffb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_315e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_315e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_315e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_315e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_0fcb_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2276_c3_b3a1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_left;
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_return_output := BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_60a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_60a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_b69b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2267_c7_001d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2267_c7_001d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_cond;
     t8_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue;
     t8_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_return_output := t8_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_60a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2273_c3_7137] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_return_output := CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2286_c21_a7f3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_a7f3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_18d3_return_output);

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_b3a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_a7f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_7137_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;
     -- BIN_OP_SR[uxn_opcodes_h_l2278_c12_dfd6] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_left;
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_return_output := BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_e877] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_60a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_b69b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2275_c7_b69b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond;
     n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue;
     n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output := n16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2264_c7_dd18] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2264_c7_dd18_cond <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_cond;
     t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue;
     t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output := t8_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_b69b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_b69b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_dfd6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_60a1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;
     -- n16_MUX[uxn_opcodes_h_l2271_c7_e877] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2271_c7_e877_cond <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_cond;
     n16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue;
     n16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output := n16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2278_c12_4f8d] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_left;
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_return_output := BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_e877] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;

     -- t8_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     t8_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     t8_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := t8_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_e877] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_001d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_e877] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2275_c7_b69b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_cond;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output := tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_dd18] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_001d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_001d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2267_c7_001d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2267_c7_001d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_cond;
     n16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue;
     n16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output := n16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2281_c21_5be1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_5be1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_4f8d_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_001d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_5be1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_b69b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_dd18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_dd18] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_dd18] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;

     -- n16_MUX[uxn_opcodes_h_l2264_c7_dd18] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond;
     n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue;
     n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output := n16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2271_c7_e877] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_cond;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output := tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b69b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_e877] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_return_output := result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2267_c7_001d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_cond;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output := tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     n16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     n16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := n16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_e877_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_001d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2264_c7_dd18] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_cond;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output := tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_001d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_dd18] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output := result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_dd18_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_315e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2246_l2290_DUPLICATE_0749 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2246_l2290_DUPLICATE_0749_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_315e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_315e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2246_l2290_DUPLICATE_0749_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2246_l2290_DUPLICATE_0749_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
