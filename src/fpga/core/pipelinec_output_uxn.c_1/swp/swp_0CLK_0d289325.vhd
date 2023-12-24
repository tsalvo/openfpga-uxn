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
-- Submodules: 36
entity swp_0CLK_0d289325 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_0d289325;
architecture arch of swp_0CLK_0d289325 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_4aff]
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2547_c2_7fcf]
signal t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_c014]
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_a474]
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_a474]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_a474]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_a474]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_a474]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2560_c7_a474]
signal n8_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2560_c7_a474]
signal t8_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_5e1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2563_c7_6a43]
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2563_c7_6a43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2563_c7_6a43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2563_c7_6a43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2563_c7_6a43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2563_c7_6a43]
signal n8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2563_c7_6a43]
signal t8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2565_c30_1c96]
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_b7d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c7_1423]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2570_c7_1423]
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c7_1423]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c7_1423]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2570_c7_1423]
signal n8_MUX_uxn_opcodes_h_l2570_c7_1423_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_1423_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_left,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_right,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- n8_MUX_uxn_opcodes_h_l2547_c2_7fcf
n8_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- t8_MUX_uxn_opcodes_h_l2547_c2_7fcf
t8_MUX_uxn_opcodes_h_l2547_c2_7fcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond,
t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue,
t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse,
t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_left,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_right,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_cond,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_return_output);

-- n8_MUX_uxn_opcodes_h_l2560_c7_a474
n8_MUX_uxn_opcodes_h_l2560_c7_a474 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2560_c7_a474_cond,
n8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue,
n8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse,
n8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output);

-- t8_MUX_uxn_opcodes_h_l2560_c7_a474
t8_MUX_uxn_opcodes_h_l2560_c7_a474 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2560_c7_a474_cond,
t8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue,
t8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse,
t8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_cond,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output);

-- n8_MUX_uxn_opcodes_h_l2563_c7_6a43
n8_MUX_uxn_opcodes_h_l2563_c7_6a43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond,
n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue,
n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse,
n8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output);

-- t8_MUX_uxn_opcodes_h_l2563_c7_6a43
t8_MUX_uxn_opcodes_h_l2563_c7_6a43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond,
t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue,
t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse,
t8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96
sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_ins,
sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_x,
sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_y,
sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_cond,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_return_output);

-- n8_MUX_uxn_opcodes_h_l2570_c7_1423
n8_MUX_uxn_opcodes_h_l2570_c7_1423 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2570_c7_1423_cond,
n8_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue,
n8_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse,
n8_MUX_uxn_opcodes_h_l2570_c7_1423_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_return_output,
 n8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output,
 t8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output,
 n8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output,
 t8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output,
 sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_return_output,
 n8_MUX_uxn_opcodes_h_l2570_c7_1423_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_745f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_d780 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_1490 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_712e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_5b51 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_0722 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_1423_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2570_l2560_l2547_DUPLICATE_550c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2560_DUPLICATE_0313_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2570_l2560_l2563_DUPLICATE_5a58_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_6f5d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2578_l2543_DUPLICATE_ad7f_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_745f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_745f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_d780 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_d780;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_712e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_712e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_0722 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_0722;
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_1490 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_1490;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_5b51 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_5b51;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2570_l2560_l2547_DUPLICATE_550c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2570_l2560_l2547_DUPLICATE_550c_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2565_c30_1c96] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_ins;
     sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_x;
     sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_return_output := sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_b7d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_5e1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2570_l2560_l2563_DUPLICATE_5a58 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2570_l2560_l2563_DUPLICATE_5a58_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2560_DUPLICATE_0313 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2560_DUPLICATE_0313_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_6f5d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_6f5d_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2570_c7_1423] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_1423_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_4aff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_c014] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_left;
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output := BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_4aff_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_c014_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_5e1f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b7d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2560_DUPLICATE_0313_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2560_DUPLICATE_0313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2570_l2560_l2563_DUPLICATE_5a58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2570_l2560_l2563_DUPLICATE_5a58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2570_l2560_l2563_DUPLICATE_5a58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_6f5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_6f5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2570_l2560_l2547_DUPLICATE_550c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2570_l2560_l2547_DUPLICATE_550c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2570_l2560_l2547_DUPLICATE_550c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_7fcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_1423_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_1c96_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c7_1423] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2570_c7_1423] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_return_output := result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c7_1423] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c7_1423] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_return_output;

     -- n8_MUX[uxn_opcodes_h_l2570_c7_1423] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2570_c7_1423_cond <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_cond;
     n8_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_iftrue;
     n8_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_return_output := n8_MUX_uxn_opcodes_h_l2570_c7_1423_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2563_c7_6a43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;

     -- t8_MUX[uxn_opcodes_h_l2563_c7_6a43] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond;
     t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue;
     t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output := t8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2570_c7_1423_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_1423_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_1423_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_1423_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_1423_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_a474] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2563_c7_6a43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;

     -- n8_MUX[uxn_opcodes_h_l2563_c7_6a43] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_cond;
     n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue;
     n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output := n8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2563_c7_6a43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;

     -- t8_MUX[uxn_opcodes_h_l2560_c7_a474] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2560_c7_a474_cond <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_cond;
     t8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue;
     t8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output := t8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2563_c7_6a43] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output := result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2563_c7_6a43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_6a43_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_a474] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_return_output := result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- t8_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_a474] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;

     -- n8_MUX[uxn_opcodes_h_l2560_c7_a474] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2560_c7_a474_cond <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_cond;
     n8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue;
     n8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output := n8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_a474] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_a474] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a474_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- n8_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_7fcf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2578_l2543_DUPLICATE_ad7f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2578_l2543_DUPLICATE_ad7f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_7fcf_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2578_l2543_DUPLICATE_ad7f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2578_l2543_DUPLICATE_ad7f_return_output;
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
