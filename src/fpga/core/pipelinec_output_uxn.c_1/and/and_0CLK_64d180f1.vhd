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
-- BIN_OP_EQ[uxn_opcodes_h_l905_c6_f2bb]
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l905_c2_6590]
signal t8_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l905_c2_6590]
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l905_c2_6590]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_6590]
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l905_c2_6590]
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_6590]
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_6590]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l905_c2_6590]
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_6590]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_6590]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l905_c2_6590]
signal n8_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l918_c11_817a]
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l918_c7_91bf]
signal t8_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l918_c7_91bf]
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_91bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_91bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_91bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_91bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l918_c7_91bf]
signal n8_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l921_c11_e656]
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l921_c7_bd37]
signal t8_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l921_c7_bd37]
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_bd37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_bd37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_bd37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_bd37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l921_c7_bd37]
signal n8_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l924_c11_bac0]
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l924_c7_624c]
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l924_c7_624c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l924_c7_624c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l924_c7_624c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l924_c7_624c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l924_c7_624c]
signal n8_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l924_c7_624c_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l926_c30_d277]
signal sp_relative_shift_uxn_opcodes_h_l926_c30_d277_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_d277_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_d277_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_d277_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l929_c21_0439]
signal BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb
BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_left,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_right,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output);

-- t8_MUX_uxn_opcodes_h_l905_c2_6590
t8_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l905_c2_6590_cond,
t8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
t8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
t8_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590
result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_cond,
result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- n8_MUX_uxn_opcodes_h_l905_c2_6590
n8_MUX_uxn_opcodes_h_l905_c2_6590 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l905_c2_6590_cond,
n8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue,
n8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse,
n8_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a
BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_left,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_right,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output);

-- t8_MUX_uxn_opcodes_h_l918_c7_91bf
t8_MUX_uxn_opcodes_h_l918_c7_91bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l918_c7_91bf_cond,
t8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue,
t8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse,
t8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf
result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_return_output);

-- n8_MUX_uxn_opcodes_h_l918_c7_91bf
n8_MUX_uxn_opcodes_h_l918_c7_91bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l918_c7_91bf_cond,
n8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue,
n8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse,
n8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656
BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_left,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_right,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output);

-- t8_MUX_uxn_opcodes_h_l921_c7_bd37
t8_MUX_uxn_opcodes_h_l921_c7_bd37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l921_c7_bd37_cond,
t8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue,
t8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse,
t8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37
result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_cond,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_return_output);

-- n8_MUX_uxn_opcodes_h_l921_c7_bd37
n8_MUX_uxn_opcodes_h_l921_c7_bd37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l921_c7_bd37_cond,
n8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue,
n8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse,
n8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0
BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_left,
BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_right,
BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c
result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_cond,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_return_output);

-- n8_MUX_uxn_opcodes_h_l924_c7_624c
n8_MUX_uxn_opcodes_h_l924_c7_624c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l924_c7_624c_cond,
n8_MUX_uxn_opcodes_h_l924_c7_624c_iftrue,
n8_MUX_uxn_opcodes_h_l924_c7_624c_iffalse,
n8_MUX_uxn_opcodes_h_l924_c7_624c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l926_c30_d277
sp_relative_shift_uxn_opcodes_h_l926_c30_d277 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l926_c30_d277_ins,
sp_relative_shift_uxn_opcodes_h_l926_c30_d277_x,
sp_relative_shift_uxn_opcodes_h_l926_c30_d277_y,
sp_relative_shift_uxn_opcodes_h_l926_c30_d277_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l929_c21_0439
BIN_OP_AND_uxn_opcodes_h_l929_c21_0439 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_left,
BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_right,
BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output,
 t8_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 n8_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output,
 t8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_return_output,
 n8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output,
 t8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_return_output,
 n8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_return_output,
 n8_MUX_uxn_opcodes_h_l924_c7_624c_return_output,
 sp_relative_shift_uxn_opcodes_h_l926_c30_d277_return_output,
 BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_0c3e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l910_c3_b4ca : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_10f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_65fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_553b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_913c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_1200_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a131_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_598e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l901_l933_DUPLICATE_70df_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_0c3e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_0c3e;
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_y := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l910_c3_b4ca := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l910_c3_b4ca;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_10f0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_10f0;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_65fe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_65fe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l905_c6_f2bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l905_c2_6590_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l921_c11_e656] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_left;
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output := BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l905_c2_6590_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_913c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_913c_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l905_c2_6590_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_1200 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_1200_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l926_c30_d277] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l926_c30_d277_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_ins;
     sp_relative_shift_uxn_opcodes_h_l926_c30_d277_x <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_x;
     sp_relative_shift_uxn_opcodes_h_l926_c30_d277_y <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_return_output := sp_relative_shift_uxn_opcodes_h_l926_c30_d277_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l929_c21_0439] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_left;
     BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_return_output := BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l924_c11_bac0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_left;
     BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output := BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a131 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a131_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_598e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_598e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_553b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_553b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l918_c11_817a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_left;
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output := BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_6590_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_0439_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_f2bb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_817a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_e656_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_bac0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a131_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a131_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_a131_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_913c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_913c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_913c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_1200_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_1200_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l921_l924_DUPLICATE_1200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_598e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_598e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_553b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_553b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_553b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l921_l905_l924_DUPLICATE_553b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l905_c2_6590_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l905_c2_6590_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_6590_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l905_c2_6590_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d277_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l924_c7_624c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_return_output := result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- n8_MUX[uxn_opcodes_h_l924_c7_624c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l924_c7_624c_cond <= VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_cond;
     n8_MUX_uxn_opcodes_h_l924_c7_624c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_iftrue;
     n8_MUX_uxn_opcodes_h_l924_c7_624c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_return_output := n8_MUX_uxn_opcodes_h_l924_c7_624c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l924_c7_624c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l924_c7_624c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l924_c7_624c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- t8_MUX[uxn_opcodes_h_l921_c7_bd37] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l921_c7_bd37_cond <= VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_cond;
     t8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue;
     t8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output := t8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l924_c7_624c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse := VAR_n8_MUX_uxn_opcodes_h_l924_c7_624c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_624c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_624c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_624c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_624c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_624c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_bd37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;

     -- n8_MUX[uxn_opcodes_h_l921_c7_bd37] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l921_c7_bd37_cond <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_cond;
     n8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue;
     n8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output := n8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l921_c7_bd37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_return_output := result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_bd37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_bd37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;

     -- t8_MUX[uxn_opcodes_h_l918_c7_91bf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l918_c7_91bf_cond <= VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_cond;
     t8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue;
     t8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output := t8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_bd37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_bd37_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_t8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_91bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;

     -- n8_MUX[uxn_opcodes_h_l918_c7_91bf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l918_c7_91bf_cond <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_cond;
     n8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue;
     n8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output := n8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l918_c7_91bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;

     -- t8_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     t8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     t8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_return_output := t8_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_91bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_91bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_91bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_n8_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_91bf_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l905_c2_6590_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_return_output := result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- n8_MUX[uxn_opcodes_h_l905_c2_6590] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l905_c2_6590_cond <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_cond;
     n8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_iftrue;
     n8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_return_output := n8_MUX_uxn_opcodes_h_l905_c2_6590_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l905_c2_6590_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l901_l933_DUPLICATE_70df LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l901_l933_DUPLICATE_70df_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_6590_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_6590_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l901_l933_DUPLICATE_70df_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l901_l933_DUPLICATE_70df_return_output;
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
