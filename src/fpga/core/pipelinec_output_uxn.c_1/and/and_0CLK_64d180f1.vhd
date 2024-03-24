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
-- BIN_OP_EQ[uxn_opcodes_h_l905_c6_a97b]
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal n8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l905_c2_5ef5]
signal t8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l918_c11_b7bf]
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l918_c7_e012]
signal n8_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_e012]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_e012]
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_e012]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_e012]
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l918_c7_e012]
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l918_c7_e012]
signal t8_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l921_c11_57ee]
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l921_c7_77e9]
signal n8_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_77e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_77e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_77e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_77e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l921_c7_77e9]
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l921_c7_77e9]
signal t8_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l924_c11_ab43]
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l924_c7_251b]
signal n8_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l924_c7_251b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l924_c7_251b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l924_c7_251b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l924_c7_251b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l924_c7_251b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l924_c7_251b]
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l926_c30_f4fb]
signal sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l929_c21_d09c]
signal BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_left,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_right,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output);

-- n8_MUX_uxn_opcodes_h_l905_c2_5ef5
n8_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
n8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5
result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- t8_MUX_uxn_opcodes_h_l905_c2_5ef5
t8_MUX_uxn_opcodes_h_l905_c2_5ef5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond,
t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue,
t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse,
t8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf
BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_left,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_right,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output);

-- n8_MUX_uxn_opcodes_h_l918_c7_e012
n8_MUX_uxn_opcodes_h_l918_c7_e012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l918_c7_e012_cond,
n8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue,
n8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse,
n8_MUX_uxn_opcodes_h_l918_c7_e012_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012
result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_cond,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_return_output);

-- t8_MUX_uxn_opcodes_h_l918_c7_e012
t8_MUX_uxn_opcodes_h_l918_c7_e012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l918_c7_e012_cond,
t8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue,
t8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse,
t8_MUX_uxn_opcodes_h_l918_c7_e012_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee
BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_left,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_right,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output);

-- n8_MUX_uxn_opcodes_h_l921_c7_77e9
n8_MUX_uxn_opcodes_h_l921_c7_77e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l921_c7_77e9_cond,
n8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue,
n8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse,
n8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9
result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_return_output);

-- t8_MUX_uxn_opcodes_h_l921_c7_77e9
t8_MUX_uxn_opcodes_h_l921_c7_77e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l921_c7_77e9_cond,
t8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue,
t8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse,
t8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43
BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_left,
BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_right,
BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output);

-- n8_MUX_uxn_opcodes_h_l924_c7_251b
n8_MUX_uxn_opcodes_h_l924_c7_251b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l924_c7_251b_cond,
n8_MUX_uxn_opcodes_h_l924_c7_251b_iftrue,
n8_MUX_uxn_opcodes_h_l924_c7_251b_iffalse,
n8_MUX_uxn_opcodes_h_l924_c7_251b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b
result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_cond,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb
sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_ins,
sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_x,
sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_y,
sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c
BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_left,
BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_right,
BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output,
 n8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 t8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output,
 n8_MUX_uxn_opcodes_h_l918_c7_e012_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_return_output,
 t8_MUX_uxn_opcodes_h_l918_c7_e012_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output,
 n8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_return_output,
 t8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output,
 n8_MUX_uxn_opcodes_h_l924_c7_251b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_return_output,
 sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_8a76 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l910_c3_0b37 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_cb4e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_ebb8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_4062_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_5457_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_e82f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a1af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_fdf4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l901_l933_DUPLICATE_6a6e_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_y := resize(to_signed(-1, 2), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l910_c3_0b37 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l910_c3_0b37;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_cb4e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_cb4e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_8a76 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_8a76;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_ebb8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_ebb8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse := t8;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l924_c11_ab43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_left;
     BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output := BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_4062 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_4062_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_e82f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_e82f_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l905_c6_a97b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_left;
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output := BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_fdf4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_fdf4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l929_c21_d09c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_left;
     BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_return_output := BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l921_c11_57ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_5457 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_5457_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l918_c11_b7bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a1af LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a1af_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l926_c30_f4fb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_ins;
     sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_x;
     sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_return_output := sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_return_output;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_d09c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a97b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_b7bf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_57ee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_ab43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_5457_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_5457_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_5457_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_e82f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_e82f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_e82f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a1af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a1af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a1af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_fdf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_fdf4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_4062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_4062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_4062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_4062_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l905_c2_5ef5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_f4fb_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l924_c7_251b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_return_output := result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- n8_MUX[uxn_opcodes_h_l924_c7_251b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l924_c7_251b_cond <= VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_cond;
     n8_MUX_uxn_opcodes_h_l924_c7_251b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_iftrue;
     n8_MUX_uxn_opcodes_h_l924_c7_251b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_return_output := n8_MUX_uxn_opcodes_h_l924_c7_251b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l924_c7_251b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l924_c7_251b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l924_c7_251b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l924_c7_251b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_return_output;

     -- t8_MUX[uxn_opcodes_h_l921_c7_77e9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l921_c7_77e9_cond <= VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_cond;
     t8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue;
     t8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output := t8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l924_c7_251b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_251b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_251b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_251b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_251b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_251b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse := VAR_t8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;
     -- t8_MUX[uxn_opcodes_h_l918_c7_e012] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l918_c7_e012_cond <= VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_cond;
     t8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue;
     t8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_return_output := t8_MUX_uxn_opcodes_h_l918_c7_e012_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_77e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_77e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_77e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;

     -- n8_MUX[uxn_opcodes_h_l921_c7_77e9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l921_c7_77e9_cond <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_cond;
     n8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue;
     n8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output := n8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l921_c7_77e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_77e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse := VAR_n8_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_77e9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l918_c7_e012_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_e012] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l918_c7_e012] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_cond;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_return_output := result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_e012] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_return_output;

     -- t8_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := t8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_e012] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_e012] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_return_output;

     -- n8_MUX[uxn_opcodes_h_l918_c7_e012] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l918_c7_e012_cond <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_cond;
     n8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_iftrue;
     n8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_return_output := n8_MUX_uxn_opcodes_h_l918_c7_e012_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l918_c7_e012_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_e012_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_e012_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_e012_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_e012_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_e012_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- n8_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := n8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_5ef5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l901_l933_DUPLICATE_6a6e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l901_l933_DUPLICATE_6a6e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_5ef5_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l901_l933_DUPLICATE_6a6e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l901_l933_DUPLICATE_6a6e_return_output;
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
