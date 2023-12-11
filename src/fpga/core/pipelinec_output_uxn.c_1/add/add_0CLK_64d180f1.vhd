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
-- Submodules: 38
entity add_0CLK_64d180f1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_64d180f1;
architecture arch of add_0CLK_64d180f1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l841_c6_46fa]
signal BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l841_c2_5877]
signal t8_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l841_c2_5877]
signal n8_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l841_c2_5877]
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l841_c2_5877]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l841_c2_5877]
signal result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l841_c2_5877]
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l841_c2_5877]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l841_c2_5877]
signal result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l841_c2_5877]
signal result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l841_c2_5877]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l841_c2_5877]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l854_c11_bb80]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l854_c7_863f]
signal t8_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l854_c7_863f]
signal n8_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_863f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l854_c7_863f]
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_863f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_863f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_863f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l857_c11_20ab]
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l857_c7_a3d2]
signal t8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l857_c7_a3d2]
signal n8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l857_c7_a3d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l857_c7_a3d2]
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l857_c7_a3d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l857_c7_a3d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l857_c7_a3d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l860_c11_e072]
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l860_c7_2d34]
signal n8_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_2d34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l860_c7_2d34]
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l860_c7_2d34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_2d34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_2d34]
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l862_c30_9b3d]
signal sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l865_c21_49eb]
signal BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa
BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_left,
BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_right,
BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output);

-- t8_MUX_uxn_opcodes_h_l841_c2_5877
t8_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l841_c2_5877_cond,
t8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
t8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
t8_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- n8_MUX_uxn_opcodes_h_l841_c2_5877
n8_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l841_c2_5877_cond,
n8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
n8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
n8_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877
result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877
result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877
result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877
result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877
result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877
result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_cond,
result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80
BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output);

-- t8_MUX_uxn_opcodes_h_l854_c7_863f
t8_MUX_uxn_opcodes_h_l854_c7_863f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l854_c7_863f_cond,
t8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue,
t8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse,
t8_MUX_uxn_opcodes_h_l854_c7_863f_return_output);

-- n8_MUX_uxn_opcodes_h_l854_c7_863f
n8_MUX_uxn_opcodes_h_l854_c7_863f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l854_c7_863f_cond,
n8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue,
n8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse,
n8_MUX_uxn_opcodes_h_l854_c7_863f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f
result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_cond,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab
BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_left,
BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_right,
BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output);

-- t8_MUX_uxn_opcodes_h_l857_c7_a3d2
t8_MUX_uxn_opcodes_h_l857_c7_a3d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond,
t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue,
t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse,
t8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output);

-- n8_MUX_uxn_opcodes_h_l857_c7_a3d2
n8_MUX_uxn_opcodes_h_l857_c7_a3d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond,
n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue,
n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse,
n8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2
result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072
BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_left,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_right,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output);

-- n8_MUX_uxn_opcodes_h_l860_c7_2d34
n8_MUX_uxn_opcodes_h_l860_c7_2d34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l860_c7_2d34_cond,
n8_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue,
n8_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse,
n8_MUX_uxn_opcodes_h_l860_c7_2d34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34
result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_cond,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34
result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_return_output);

-- sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d
sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_ins,
sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_x,
sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_y,
sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb
BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_left,
BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_right,
BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output,
 t8_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 n8_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output,
 t8_MUX_uxn_opcodes_h_l854_c7_863f_return_output,
 n8_MUX_uxn_opcodes_h_l854_c7_863f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output,
 t8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output,
 n8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output,
 n8_MUX_uxn_opcodes_h_l860_c7_2d34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_return_output,
 sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l846_c3_a1ec : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_fc09 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_9496 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l865_c3_1f87 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_0a68 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l857_l860_l841_DUPLICATE_94e9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_d2ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_43e4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_3a69_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l857_l860_DUPLICATE_a2c9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l869_l837_DUPLICATE_6f3f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_0a68 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_0a68;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_fc09 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_fc09;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_y := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l846_c3_a1ec := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l846_c3_a1ec;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_9496 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_9496;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse := t8;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l841_c2_5877_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l860_c11_e072] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_left;
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output := BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l854_c11_bb80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l841_c2_5877_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_43e4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_43e4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l857_l860_l841_DUPLICATE_94e9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l857_l860_l841_DUPLICATE_94e9_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l857_l860_DUPLICATE_a2c9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l857_l860_DUPLICATE_a2c9_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l841_c2_5877_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l841_c6_46fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_d2ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_d2ee_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l862_c30_9b3d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_ins;
     sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_x;
     sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_return_output := sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l841_c2_5877_return_output := result.is_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l865_c21_49eb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_3a69 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_3a69_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l857_c11_20ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_46fa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_bb80_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_20ab_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_e072_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l865_c3_1f87 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_49eb_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_43e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_43e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_43e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_d2ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_d2ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_d2ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_3a69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_3a69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_3a69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l857_l860_DUPLICATE_a2c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l857_l860_DUPLICATE_a2c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l857_l860_l841_DUPLICATE_94e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l857_l860_l841_DUPLICATE_94e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l857_l860_l841_DUPLICATE_94e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l857_l860_l841_DUPLICATE_94e9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l841_c2_5877_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l841_c2_5877_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l841_c2_5877_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l841_c2_5877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_9b3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue := VAR_result_u8_value_uxn_opcodes_h_l865_c3_1f87;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_2d34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;

     -- t8_MUX[uxn_opcodes_h_l857_c7_a3d2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond <= VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond;
     t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue;
     t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output := t8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l860_c7_2d34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_cond;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_return_output := result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_2d34] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_2d34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l860_c7_2d34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;

     -- n8_MUX[uxn_opcodes_h_l860_c7_2d34] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l860_c7_2d34_cond <= VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_cond;
     n8_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_iftrue;
     n8_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_return_output := n8_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_2d34_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l857_c7_a3d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;

     -- n8_MUX[uxn_opcodes_h_l857_c7_a3d2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond <= VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_cond;
     n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue;
     n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output := n8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l857_c7_a3d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l857_c7_a3d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l857_c7_a3d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l857_c7_a3d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;

     -- t8_MUX[uxn_opcodes_h_l854_c7_863f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l854_c7_863f_cond <= VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_cond;
     t8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue;
     t8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_return_output := t8_MUX_uxn_opcodes_h_l854_c7_863f_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_a3d2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_t8_MUX_uxn_opcodes_h_l854_c7_863f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_863f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_863f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l854_c7_863f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_return_output := result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_863f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_return_output;

     -- t8_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     t8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     t8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_return_output := t8_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- n8_MUX[uxn_opcodes_h_l854_c7_863f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l854_c7_863f_cond <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_cond;
     n8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_iftrue;
     n8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_return_output := n8_MUX_uxn_opcodes_h_l854_c7_863f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_863f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_n8_MUX_uxn_opcodes_h_l854_c7_863f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_863f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_863f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_863f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_863f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_863f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l841_c2_5877_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_return_output := result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- n8_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     n8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     n8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_return_output := n8_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l841_c2_5877] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l841_c2_5877_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l869_l837_DUPLICATE_6f3f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l869_l837_DUPLICATE_6f3f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_5877_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_5877_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l869_l837_DUPLICATE_6f3f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l869_l837_DUPLICATE_6f3f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
