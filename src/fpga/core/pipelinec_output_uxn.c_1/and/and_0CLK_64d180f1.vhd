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
-- BIN_OP_EQ[uxn_opcodes_h_l905_c6_7704]
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l905_c2_c26f]
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_c26f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_c26f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l905_c2_c26f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_c26f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l905_c2_c26f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l905_c2_c26f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_c26f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_c26f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l905_c2_c26f]
signal t8_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l905_c2_c26f]
signal n8_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l918_c11_4f93]
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l918_c7_6dbc]
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_6dbc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_6dbc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_6dbc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_6dbc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l918_c7_6dbc]
signal t8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l918_c7_6dbc]
signal n8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l921_c11_6c0a]
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l921_c7_6bf8]
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_6bf8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_6bf8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_6bf8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_6bf8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l921_c7_6bf8]
signal t8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l921_c7_6bf8]
signal n8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l924_c11_abb3]
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l924_c7_3617]
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l924_c7_3617]
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l924_c7_3617]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l924_c7_3617]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l924_c7_3617]
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l924_c7_3617]
signal n8_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l924_c7_3617_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l926_c30_dcd8]
signal sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l929_c21_340f]
signal BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704
BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_left,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_right,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f
result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- t8_MUX_uxn_opcodes_h_l905_c2_c26f
t8_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
t8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
t8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
t8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- n8_MUX_uxn_opcodes_h_l905_c2_c26f
n8_MUX_uxn_opcodes_h_l905_c2_c26f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l905_c2_c26f_cond,
n8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue,
n8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse,
n8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93
BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_left,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_right,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc
result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_cond,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output);

-- t8_MUX_uxn_opcodes_h_l918_c7_6dbc
t8_MUX_uxn_opcodes_h_l918_c7_6dbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond,
t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue,
t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse,
t8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output);

-- n8_MUX_uxn_opcodes_h_l918_c7_6dbc
n8_MUX_uxn_opcodes_h_l918_c7_6dbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond,
n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue,
n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse,
n8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a
BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_left,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_right,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8
result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_cond,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output);

-- t8_MUX_uxn_opcodes_h_l921_c7_6bf8
t8_MUX_uxn_opcodes_h_l921_c7_6bf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond,
t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue,
t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse,
t8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output);

-- n8_MUX_uxn_opcodes_h_l921_c7_6bf8
n8_MUX_uxn_opcodes_h_l921_c7_6bf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond,
n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue,
n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse,
n8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3
BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_left,
BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_right,
BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617
result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_cond,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_return_output);

-- n8_MUX_uxn_opcodes_h_l924_c7_3617
n8_MUX_uxn_opcodes_h_l924_c7_3617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l924_c7_3617_cond,
n8_MUX_uxn_opcodes_h_l924_c7_3617_iftrue,
n8_MUX_uxn_opcodes_h_l924_c7_3617_iffalse,
n8_MUX_uxn_opcodes_h_l924_c7_3617_return_output);

-- sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8
sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_ins,
sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_x,
sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_y,
sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l929_c21_340f
BIN_OP_AND_uxn_opcodes_h_l929_c21_340f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_left,
BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_right,
BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 t8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 n8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output,
 t8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output,
 n8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output,
 t8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output,
 n8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_return_output,
 n8_MUX_uxn_opcodes_h_l924_c7_3617_return_output,
 sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_e75d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l910_c3_3044 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_39e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_716b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l905_l924_l918_DUPLICATE_a44e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_1453_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_12a8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_fffa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_3263_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l901_l933_DUPLICATE_f270_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_39e8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_39e8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l910_c3_3044 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l910_c3_3044;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_e75d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_e75d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_716b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_716b;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l929_c21_340f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_left;
     BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_return_output := BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l926_c30_dcd8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_ins;
     sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_x;
     sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_return_output := sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_1453 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_1453_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l924_c11_abb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l905_c2_c26f_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_c26f_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_3263 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_3263_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l905_c2_c26f_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_fffa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_fffa_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l921_c11_6c0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l905_c6_7704] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_left;
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output := BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_12a8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_12a8_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l905_l924_l918_DUPLICATE_a44e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l905_l924_l918_DUPLICATE_a44e_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l905_c2_c26f_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l918_c11_4f93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_left;
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output := BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l929_c21_340f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_7704_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_4f93_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_6c0a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_abb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_12a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_12a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_12a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_fffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_fffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_fffa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_1453_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_1453_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l924_l918_DUPLICATE_1453_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_3263_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l921_l924_DUPLICATE_3263_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l905_l924_l918_DUPLICATE_a44e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l905_l924_l918_DUPLICATE_a44e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l905_l924_l918_DUPLICATE_a44e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l921_l905_l924_l918_DUPLICATE_a44e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l905_c2_c26f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l905_c2_c26f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_c26f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l905_c2_c26f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_dcd8_return_output;
     -- n8_MUX[uxn_opcodes_h_l924_c7_3617] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l924_c7_3617_cond <= VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_cond;
     n8_MUX_uxn_opcodes_h_l924_c7_3617_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_iftrue;
     n8_MUX_uxn_opcodes_h_l924_c7_3617_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_return_output := n8_MUX_uxn_opcodes_h_l924_c7_3617_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l924_c7_3617] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_return_output;

     -- t8_MUX[uxn_opcodes_h_l921_c7_6bf8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond <= VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond;
     t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue;
     t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output := t8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l924_c7_3617] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l924_c7_3617] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l924_c7_3617] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l924_c7_3617] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_cond;
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_return_output := result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l924_c7_3617_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_3617_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_3617_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_3617_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_3617_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_3617_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;
     -- t8_MUX[uxn_opcodes_h_l918_c7_6dbc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond <= VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond;
     t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue;
     t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output := t8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;

     -- n8_MUX[uxn_opcodes_h_l921_c7_6bf8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_cond;
     n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue;
     n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output := n8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_6bf8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_6bf8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_6bf8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l921_c7_6bf8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output := result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_6bf8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_6bf8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l918_c7_6dbc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output := result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_6dbc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;

     -- n8_MUX[uxn_opcodes_h_l918_c7_6dbc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_cond;
     n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue;
     n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output := n8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_6dbc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;

     -- t8_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     t8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     t8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := t8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_6dbc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_6dbc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_6dbc_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- n8_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     n8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     n8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := n8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_c26f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l905_c2_c26f_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l901_l933_DUPLICATE_f270 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l901_l933_DUPLICATE_f270_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_c26f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_c26f_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l901_l933_DUPLICATE_f270_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l901_l933_DUPLICATE_f270_return_output;
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
