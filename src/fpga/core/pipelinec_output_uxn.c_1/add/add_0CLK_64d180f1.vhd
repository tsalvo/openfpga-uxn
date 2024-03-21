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
-- BIN_OP_EQ[uxn_opcodes_h_l819_c6_e60e]
signal BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l819_c2_c59b]
signal n8_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l819_c2_c59b]
signal t8_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c2_c59b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c2_c59b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l819_c2_c59b]
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l819_c2_c59b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l819_c2_c59b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l819_c2_c59b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c2_c59b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l819_c2_c59b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l819_c2_c59b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l832_c11_da29]
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l832_c7_93df]
signal n8_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l832_c7_93df]
signal t8_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l832_c7_93df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l832_c7_93df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l832_c7_93df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l832_c7_93df]
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l832_c7_93df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_bb70]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l835_c7_7133]
signal n8_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l835_c7_7133]
signal t8_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_7133]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_7133]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_7133]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l835_c7_7133]
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_7133]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_acb0]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l838_c7_5ce9]
signal n8_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_5ce9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_5ce9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_5ce9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l838_c7_5ce9]
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_5ce9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l840_c30_1e13]
signal sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l843_c21_95dd]
signal BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e
BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_left,
BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_right,
BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output);

-- n8_MUX_uxn_opcodes_h_l819_c2_c59b
n8_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
n8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
n8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
n8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- t8_MUX_uxn_opcodes_h_l819_c2_c59b
t8_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
t8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
t8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
t8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b
result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29
BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_left,
BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_right,
BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output);

-- n8_MUX_uxn_opcodes_h_l832_c7_93df
n8_MUX_uxn_opcodes_h_l832_c7_93df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l832_c7_93df_cond,
n8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue,
n8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse,
n8_MUX_uxn_opcodes_h_l832_c7_93df_return_output);

-- t8_MUX_uxn_opcodes_h_l832_c7_93df
t8_MUX_uxn_opcodes_h_l832_c7_93df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l832_c7_93df_cond,
t8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue,
t8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse,
t8_MUX_uxn_opcodes_h_l832_c7_93df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df
result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_cond,
result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70
BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output);

-- n8_MUX_uxn_opcodes_h_l835_c7_7133
n8_MUX_uxn_opcodes_h_l835_c7_7133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l835_c7_7133_cond,
n8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue,
n8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse,
n8_MUX_uxn_opcodes_h_l835_c7_7133_return_output);

-- t8_MUX_uxn_opcodes_h_l835_c7_7133
t8_MUX_uxn_opcodes_h_l835_c7_7133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l835_c7_7133_cond,
t8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue,
t8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse,
t8_MUX_uxn_opcodes_h_l835_c7_7133_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133
result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_cond,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0
BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output);

-- n8_MUX_uxn_opcodes_h_l838_c7_5ce9
n8_MUX_uxn_opcodes_h_l838_c7_5ce9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l838_c7_5ce9_cond,
n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue,
n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse,
n8_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9
result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_cond,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l840_c30_1e13
sp_relative_shift_uxn_opcodes_h_l840_c30_1e13 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_ins,
sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_x,
sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_y,
sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_left,
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_right,
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output,
 n8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 t8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output,
 n8_MUX_uxn_opcodes_h_l832_c7_93df_return_output,
 t8_MUX_uxn_opcodes_h_l832_c7_93df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output,
 n8_MUX_uxn_opcodes_h_l835_c7_7133_return_output,
 t8_MUX_uxn_opcodes_h_l835_c7_7133_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output,
 n8_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output,
 sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_3eab : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_3ceb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_d54a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_f851 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l843_c3_ab3e : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l832_l835_l819_DUPLICATE_2e2b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_4e89_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_e279_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_2b49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l835_DUPLICATE_df45_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l847_l815_DUPLICATE_031b_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_3ceb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_3ceb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_d54a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_d54a;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_f851 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_f851;
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_3eab := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_3eab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_bb70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l843_c21_95dd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_acb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l840_c30_1e13] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_ins;
     sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_x <= VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_x;
     sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_y <= VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_return_output := sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_2b49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_2b49_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_4e89 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_4e89_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l835_DUPLICATE_df45 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l835_DUPLICATE_df45_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l832_c11_da29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_left;
     BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output := BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l819_c2_c59b_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_c2_c59b_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l832_l835_l819_DUPLICATE_2e2b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l832_l835_l819_DUPLICATE_2e2b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l819_c6_e60e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_left;
     BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output := BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_e279 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_e279_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l819_c2_c59b_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l819_c2_c59b_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e60e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_da29_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_bb70_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_acb0_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l843_c3_ab3e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_95dd_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_4e89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_4e89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_4e89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_e279_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_e279_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_e279_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_2b49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_2b49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_2b49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l835_DUPLICATE_df45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l835_DUPLICATE_df45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l832_l835_l819_DUPLICATE_2e2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l832_l835_l819_DUPLICATE_2e2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l832_l835_l819_DUPLICATE_2e2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l838_l832_l835_l819_DUPLICATE_2e2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_c2_c59b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l819_c2_c59b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l819_c2_c59b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l819_c2_c59b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_1e13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue := VAR_result_u8_value_uxn_opcodes_h_l843_c3_ab3e;
     -- n8_MUX[uxn_opcodes_h_l838_c7_5ce9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l838_c7_5ce9_cond <= VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_cond;
     n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue;
     n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output := n8_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;

     -- t8_MUX[uxn_opcodes_h_l835_c7_7133] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l835_c7_7133_cond <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_cond;
     t8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue;
     t8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_return_output := t8_MUX_uxn_opcodes_h_l835_c7_7133_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_5ce9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_5ce9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l838_c7_5ce9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output := result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_5ce9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_5ce9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse := VAR_n8_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ce9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse := VAR_t8_MUX_uxn_opcodes_h_l835_c7_7133_return_output;
     -- n8_MUX[uxn_opcodes_h_l835_c7_7133] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l835_c7_7133_cond <= VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_cond;
     n8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_iftrue;
     n8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_return_output := n8_MUX_uxn_opcodes_h_l835_c7_7133_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_7133] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_7133] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l835_c7_7133] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_cond;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_return_output := result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_7133] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_return_output;

     -- t8_MUX[uxn_opcodes_h_l832_c7_93df] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l832_c7_93df_cond <= VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_cond;
     t8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue;
     t8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_return_output := t8_MUX_uxn_opcodes_h_l832_c7_93df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_7133] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse := VAR_n8_MUX_uxn_opcodes_h_l835_c7_7133_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_7133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_7133_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_7133_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_7133_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_7133_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l832_c7_93df_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l832_c7_93df] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_cond;
     result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_return_output := result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l832_c7_93df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l832_c7_93df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_return_output;

     -- n8_MUX[uxn_opcodes_h_l832_c7_93df] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l832_c7_93df_cond <= VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_cond;
     n8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_iftrue;
     n8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_return_output := n8_MUX_uxn_opcodes_h_l832_c7_93df_return_output;

     -- t8_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     t8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     t8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := t8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l832_c7_93df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l832_c7_93df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l832_c7_93df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_93df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_93df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_93df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_93df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_93df_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- n8_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     n8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     n8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := n8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c2_c59b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l819_c2_c59b_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l847_l815_DUPLICATE_031b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l847_l815_DUPLICATE_031b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_c59b_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l847_l815_DUPLICATE_031b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l847_l815_DUPLICATE_031b_return_output;
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
