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
entity and_0CLK_64d180f1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_64d180f1;
architecture arch of and_0CLK_64d180f1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l921_c6_f12b]
signal BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l921_c2_35f9]
signal t8_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l921_c2_35f9]
signal n8_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l921_c2_35f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l921_c2_35f9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l921_c2_35f9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l921_c2_35f9]
signal result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l921_c2_35f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c2_35f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l921_c2_35f9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c2_35f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l921_c2_35f9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l934_c11_168d]
signal BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l934_c7_34fb]
signal t8_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l934_c7_34fb]
signal n8_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l934_c7_34fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l934_c7_34fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l934_c7_34fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l934_c7_34fb]
signal result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l934_c7_34fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l937_c11_3ceb]
signal BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l937_c7_72d1]
signal t8_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l937_c7_72d1]
signal n8_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l937_c7_72d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l937_c7_72d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l937_c7_72d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l937_c7_72d1]
signal result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l937_c7_72d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l940_c11_7ef2]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l940_c7_3342]
signal n8_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l940_c7_3342_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_3342]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c7_3342]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_3342]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l940_c7_3342]
signal result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_3342]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l942_c30_9c9d]
signal sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l945_c21_82ec]
signal BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b
BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_left,
BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_right,
BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output);

-- t8_MUX_uxn_opcodes_h_l921_c2_35f9
t8_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
t8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
t8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
t8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- n8_MUX_uxn_opcodes_h_l921_c2_35f9
n8_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
n8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
n8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
n8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9
result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9
result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9
result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9
result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9
result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9
result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d
BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_left,
BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_right,
BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output);

-- t8_MUX_uxn_opcodes_h_l934_c7_34fb
t8_MUX_uxn_opcodes_h_l934_c7_34fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l934_c7_34fb_cond,
t8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue,
t8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse,
t8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output);

-- n8_MUX_uxn_opcodes_h_l934_c7_34fb
n8_MUX_uxn_opcodes_h_l934_c7_34fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l934_c7_34fb_cond,
n8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue,
n8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse,
n8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb
result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_cond,
result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb
BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_left,
BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_right,
BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output);

-- t8_MUX_uxn_opcodes_h_l937_c7_72d1
t8_MUX_uxn_opcodes_h_l937_c7_72d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l937_c7_72d1_cond,
t8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue,
t8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse,
t8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output);

-- n8_MUX_uxn_opcodes_h_l937_c7_72d1
n8_MUX_uxn_opcodes_h_l937_c7_72d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l937_c7_72d1_cond,
n8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue,
n8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse,
n8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1
result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1
result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1
result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2
BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output);

-- n8_MUX_uxn_opcodes_h_l940_c7_3342
n8_MUX_uxn_opcodes_h_l940_c7_3342 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l940_c7_3342_cond,
n8_MUX_uxn_opcodes_h_l940_c7_3342_iftrue,
n8_MUX_uxn_opcodes_h_l940_c7_3342_iffalse,
n8_MUX_uxn_opcodes_h_l940_c7_3342_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342
result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_cond,
result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_return_output);

-- sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d
sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_ins,
sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_x,
sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_y,
sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec
BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_left,
BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_right,
BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output,
 t8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 n8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output,
 t8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output,
 n8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output,
 t8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output,
 n8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output,
 n8_MUX_uxn_opcodes_h_l940_c7_3342_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_return_output,
 sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l926_c3_0315 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l931_c3_2508 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_7b9e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l944_c3_ecbf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l940_l934_l937_DUPLICATE_8081_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_7101_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_b159_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_2885_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l940_l937_DUPLICATE_dd9f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l949_l917_DUPLICATE_8673_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_7b9e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_7b9e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l931_c3_2508 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l931_c3_2508;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l926_c3_0315 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l926_c3_0315;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l944_c3_ecbf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l944_c3_ecbf;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l942_c30_9c9d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_ins;
     sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_x;
     sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_return_output := sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l940_l934_l937_DUPLICATE_8081 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l940_l934_l937_DUPLICATE_8081_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l921_c2_35f9_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_2885 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_2885_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_7101 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_7101_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l921_c6_f12b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_left;
     BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output := BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l921_c2_35f9_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_b159 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_b159_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l921_c2_35f9_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l940_c11_7ef2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l934_c11_168d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_left;
     BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output := BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l945_c21_82ec] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_left;
     BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_return_output := BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l921_c2_35f9_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l937_c11_3ceb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_left;
     BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output := BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l940_l937_DUPLICATE_dd9f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l940_l937_DUPLICATE_dd9f_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l945_c21_82ec_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c6_f12b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c11_168d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_3ceb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_7ef2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_7101_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_7101_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_7101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_2885_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_2885_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_2885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_b159_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_b159_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l940_l934_l937_DUPLICATE_b159_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l940_l937_DUPLICATE_dd9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l940_l937_DUPLICATE_dd9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l940_l934_l937_DUPLICATE_8081_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l940_l934_l937_DUPLICATE_8081_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l940_l934_l937_DUPLICATE_8081_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l940_l934_l937_DUPLICATE_8081_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l921_c2_35f9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l921_c2_35f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l921_c2_35f9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l921_c2_35f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l942_c30_9c9d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c7_3342] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_3342] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_3342] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_3342] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l940_c7_3342] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_cond;
     result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_return_output := result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- n8_MUX[uxn_opcodes_h_l940_c7_3342] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l940_c7_3342_cond <= VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_cond;
     n8_MUX_uxn_opcodes_h_l940_c7_3342_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_iftrue;
     n8_MUX_uxn_opcodes_h_l940_c7_3342_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_return_output := n8_MUX_uxn_opcodes_h_l940_c7_3342_return_output;

     -- t8_MUX[uxn_opcodes_h_l937_c7_72d1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l937_c7_72d1_cond <= VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_cond;
     t8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue;
     t8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output := t8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l940_c7_3342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3342_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3342_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3342_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3342_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3342_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l937_c7_72d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l937_c7_72d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l937_c7_72d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;

     -- n8_MUX[uxn_opcodes_h_l937_c7_72d1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l937_c7_72d1_cond <= VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_cond;
     n8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue;
     n8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output := n8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l937_c7_72d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;

     -- t8_MUX[uxn_opcodes_h_l934_c7_34fb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l934_c7_34fb_cond <= VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_cond;
     t8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue;
     t8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output := t8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l937_c7_72d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l937_c7_72d1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l934_c7_34fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l934_c7_34fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;

     -- n8_MUX[uxn_opcodes_h_l934_c7_34fb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l934_c7_34fb_cond <= VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_cond;
     n8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue;
     n8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output := n8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;

     -- t8_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     t8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     t8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := t8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l934_c7_34fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l934_c7_34fb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_return_output := result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l934_c7_34fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l934_c7_34fb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- n8_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     n8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     n8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := n8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c2_35f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l921_c2_35f9_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l949_l917_DUPLICATE_8673 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l949_l917_DUPLICATE_8673_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c2_35f9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l921_c2_35f9_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l949_l917_DUPLICATE_8673_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l949_l917_DUPLICATE_8673_return_output;
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
