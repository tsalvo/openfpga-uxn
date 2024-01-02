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
-- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_d2be]
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2547_c2_348f]
signal n8_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2547_c2_348f]
signal t8_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_348f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2547_c2_348f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_348f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_348f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_348f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2547_c2_348f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_348f]
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2547_c2_348f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2547_c2_348f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_fb0c]
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2560_c7_2df2]
signal n8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2560_c7_2df2]
signal t8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_2df2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_2df2]
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_2df2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_2df2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_2df2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_27b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2563_c7_66ce]
signal n8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2563_c7_66ce]
signal t8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2563_c7_66ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2563_c7_66ce]
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2563_c7_66ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2563_c7_66ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2563_c7_66ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2565_c30_a6f1]
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_0671]
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2570_c7_4e8b]
signal n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c7_4e8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c7_4e8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c7_4e8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2570_c7_4e8b]
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_left,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_right,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output);

-- n8_MUX_uxn_opcodes_h_l2547_c2_348f
n8_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
n8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
n8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
n8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- t8_MUX_uxn_opcodes_h_l2547_c2_348f
t8_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
t8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
t8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
t8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_left,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_right,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output);

-- n8_MUX_uxn_opcodes_h_l2560_c7_2df2
n8_MUX_uxn_opcodes_h_l2560_c7_2df2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond,
n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue,
n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse,
n8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output);

-- t8_MUX_uxn_opcodes_h_l2560_c7_2df2
t8_MUX_uxn_opcodes_h_l2560_c7_2df2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond,
t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue,
t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse,
t8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output);

-- n8_MUX_uxn_opcodes_h_l2563_c7_66ce
n8_MUX_uxn_opcodes_h_l2563_c7_66ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond,
n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue,
n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse,
n8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output);

-- t8_MUX_uxn_opcodes_h_l2563_c7_66ce
t8_MUX_uxn_opcodes_h_l2563_c7_66ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond,
t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue,
t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse,
t8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1
sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_ins,
sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_x,
sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_y,
sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_left,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_right,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output);

-- n8_MUX_uxn_opcodes_h_l2570_c7_4e8b
n8_MUX_uxn_opcodes_h_l2570_c7_4e8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond,
n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue,
n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse,
n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output,
 n8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 t8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output,
 n8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output,
 t8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output,
 n8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output,
 t8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output,
 sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output,
 n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_58a9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_3440 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_730a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_b47e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_c0df : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_15c3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_4e8b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2570_l2560_DUPLICATE_60dc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2560_DUPLICATE_6d96_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2563_l2560_DUPLICATE_c92b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2563_l2570_l2560_DUPLICATE_1837_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2578_l2543_DUPLICATE_4919_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_15c3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_15c3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_730a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_730a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_3440 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_3440;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_58a9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_58a9;
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_c0df := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_c0df;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_b47e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_b47e;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2570_c7_4e8b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_4e8b_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_348f_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2563_l2570_l2560_DUPLICATE_1837 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2563_l2570_l2560_DUPLICATE_1837_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_27b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_fb0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_348f_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_348f_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2560_DUPLICATE_6d96 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2560_DUPLICATE_6d96_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_348f_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2565_c30_a6f1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_ins;
     sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_x;
     sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_return_output := sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2570_l2560_DUPLICATE_60dc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2570_l2560_DUPLICATE_60dc_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2563_l2560_DUPLICATE_c92b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2563_l2560_DUPLICATE_c92b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_d2be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_left;
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output := BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_0671] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_left;
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output := BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_d2be_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_fb0c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_27b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_0671_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2560_DUPLICATE_6d96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2570_l2560_DUPLICATE_6d96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2563_l2570_l2560_DUPLICATE_1837_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2563_l2570_l2560_DUPLICATE_1837_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2563_l2570_l2560_DUPLICATE_1837_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2563_l2560_DUPLICATE_c92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2563_l2560_DUPLICATE_c92b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2570_l2560_DUPLICATE_60dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2570_l2560_DUPLICATE_60dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2570_l2560_DUPLICATE_60dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_348f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_348f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_348f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_348f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_4e8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_a6f1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c7_4e8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2570_c7_4e8b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2563_c7_66ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c7_4e8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2570_c7_4e8b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond;
     n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue;
     n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output := n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c7_4e8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2563_c7_66ce] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond;
     t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue;
     t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output := t8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_4e8b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2563_c7_66ce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2563_c7_66ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_2df2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2560_c7_2df2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond;
     t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue;
     t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output := t8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2563_c7_66ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2563_c7_66ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;

     -- n8_MUX[uxn_opcodes_h_l2563_c7_66ce] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_cond;
     n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iftrue;
     n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output := n8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_66ce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_2df2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_2df2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_2df2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2560_c7_2df2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_cond;
     n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue;
     n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output := n8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_2df2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     t8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     t8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := t8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_2df2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     n8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     n8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := n8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_348f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2547_c2_348f_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2578_l2543_DUPLICATE_4919 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2578_l2543_DUPLICATE_4919_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_348f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_348f_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2578_l2543_DUPLICATE_4919_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2578_l2543_DUPLICATE_4919_return_output;
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
