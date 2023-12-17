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
-- Submodules: 39
entity jcn_0CLK_226c8821 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_226c8821;
architecture arch of jcn_0CLK_226c8821 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l680_c6_8a8d]
signal BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l680_c2_8047]
signal n8_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l680_c2_8047]
signal t8_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l680_c2_8047]
signal result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l680_c2_8047]
signal result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l680_c2_8047]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l680_c2_8047]
signal result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l680_c2_8047]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l680_c2_8047]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l680_c2_8047]
signal result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l680_c2_8047]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l680_c2_8047]
signal result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l693_c11_0c26]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l693_c7_9241]
signal n8_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l693_c7_9241]
signal t8_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c7_9241]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l693_c7_9241]
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c7_9241]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c7_9241]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_9241]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l696_c11_75cd]
signal BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l696_c7_5002]
signal n8_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l696_c7_5002_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l696_c7_5002]
signal t8_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l696_c7_5002_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l696_c7_5002]
signal result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l696_c7_5002]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l696_c7_5002]
signal result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l696_c7_5002]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l699_c11_e77a]
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l699_c7_8e76]
signal n8_MUX_uxn_opcodes_h_l699_c7_8e76_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l699_c7_8e76_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l699_c7_8e76]
signal result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_8e76]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_8e76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l699_c7_8e76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l701_c30_d340]
signal sp_relative_shift_uxn_opcodes_h_l701_c30_d340_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l701_c30_d340_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l701_c30_d340_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l701_c30_d340_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l703_c22_1667]
signal BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l703_c37_c48f]
signal BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l703_c22_3d1d]
signal MUX_uxn_opcodes_h_l703_c22_3d1d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l703_c22_3d1d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l703_c22_3d1d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l703_c22_3d1d_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d
BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_left,
BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_right,
BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output);

-- n8_MUX_uxn_opcodes_h_l680_c2_8047
n8_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l680_c2_8047_cond,
n8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
n8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
n8_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- t8_MUX_uxn_opcodes_h_l680_c2_8047
t8_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l680_c2_8047_cond,
t8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
t8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
t8_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047
result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047
result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047
result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047
result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047
result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_cond,
result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047
result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047
result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26
BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output);

-- n8_MUX_uxn_opcodes_h_l693_c7_9241
n8_MUX_uxn_opcodes_h_l693_c7_9241 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l693_c7_9241_cond,
n8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue,
n8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse,
n8_MUX_uxn_opcodes_h_l693_c7_9241_return_output);

-- t8_MUX_uxn_opcodes_h_l693_c7_9241
t8_MUX_uxn_opcodes_h_l693_c7_9241 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l693_c7_9241_cond,
t8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue,
t8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse,
t8_MUX_uxn_opcodes_h_l693_c7_9241_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241
result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_cond,
result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd
BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_left,
BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_right,
BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output);

-- n8_MUX_uxn_opcodes_h_l696_c7_5002
n8_MUX_uxn_opcodes_h_l696_c7_5002 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l696_c7_5002_cond,
n8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue,
n8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse,
n8_MUX_uxn_opcodes_h_l696_c7_5002_return_output);

-- t8_MUX_uxn_opcodes_h_l696_c7_5002
t8_MUX_uxn_opcodes_h_l696_c7_5002 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l696_c7_5002_cond,
t8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue,
t8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse,
t8_MUX_uxn_opcodes_h_l696_c7_5002_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002
result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_cond,
result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002
result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002
result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002
result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a
BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_left,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_right,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output);

-- n8_MUX_uxn_opcodes_h_l699_c7_8e76
n8_MUX_uxn_opcodes_h_l699_c7_8e76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l699_c7_8e76_cond,
n8_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue,
n8_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse,
n8_MUX_uxn_opcodes_h_l699_c7_8e76_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76
result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_cond,
result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76
result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_return_output);

-- sp_relative_shift_uxn_opcodes_h_l701_c30_d340
sp_relative_shift_uxn_opcodes_h_l701_c30_d340 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l701_c30_d340_ins,
sp_relative_shift_uxn_opcodes_h_l701_c30_d340_x,
sp_relative_shift_uxn_opcodes_h_l701_c30_d340_y,
sp_relative_shift_uxn_opcodes_h_l701_c30_d340_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667
BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_left,
BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_right,
BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f
BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_left,
BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_right,
BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_return_output);

-- MUX_uxn_opcodes_h_l703_c22_3d1d
MUX_uxn_opcodes_h_l703_c22_3d1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l703_c22_3d1d_cond,
MUX_uxn_opcodes_h_l703_c22_3d1d_iftrue,
MUX_uxn_opcodes_h_l703_c22_3d1d_iffalse,
MUX_uxn_opcodes_h_l703_c22_3d1d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output,
 n8_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 t8_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output,
 n8_MUX_uxn_opcodes_h_l693_c7_9241_return_output,
 t8_MUX_uxn_opcodes_h_l693_c7_9241_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output,
 n8_MUX_uxn_opcodes_h_l696_c7_5002_return_output,
 t8_MUX_uxn_opcodes_h_l696_c7_5002_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output,
 n8_MUX_uxn_opcodes_h_l699_c7_8e76_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_return_output,
 sp_relative_shift_uxn_opcodes_h_l701_c30_d340_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_return_output,
 MUX_uxn_opcodes_h_l703_c22_3d1d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l685_c3_15a5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l690_c3_8611 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_8413 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l693_c7_9241_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l703_c42_9ef9_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l696_l680_l699_l693_DUPLICATE_3eb4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_1fd1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_086b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_54bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l707_l676_DUPLICATE_580b_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l685_c3_15a5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l685_c3_15a5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l690_c3_8611 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l690_c3_8611;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_8413 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_8413;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l703_c22_1667] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_left;
     BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_return_output := BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l693_c7_9241] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l693_c7_9241_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l699_c11_e77a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_left;
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output := BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l680_c2_8047_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l680_c2_8047_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l696_l680_l699_l693_DUPLICATE_3eb4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l696_l680_l699_l693_DUPLICATE_3eb4_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l696_c11_75cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l680_c6_8a8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_086b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_086b_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c11_0c26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l701_c30_d340] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l701_c30_d340_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_ins;
     sp_relative_shift_uxn_opcodes_h_l701_c30_d340_x <= VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_x;
     sp_relative_shift_uxn_opcodes_h_l701_c30_d340_y <= VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_return_output := sp_relative_shift_uxn_opcodes_h_l701_c30_d340_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_1fd1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_1fd1_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l703_c42_9ef9] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l703_c42_9ef9_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l680_c2_8047_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_54bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_54bc_return_output := result.is_opc_done;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l680_c2_8047_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l680_c6_8a8d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_0c26_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_75cd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_e77a_return_output;
     VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c22_1667_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l703_c42_9ef9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_1fd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_1fd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_1fd1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l696_l680_l699_l693_DUPLICATE_3eb4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l696_l680_l699_l693_DUPLICATE_3eb4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l696_l680_l699_l693_DUPLICATE_3eb4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l696_l680_l699_l693_DUPLICATE_3eb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_54bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_54bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_54bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_086b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_086b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l699_l693_DUPLICATE_086b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l680_c2_8047_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l680_c2_8047_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l680_c2_8047_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l680_c2_8047_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l693_c7_9241_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l701_c30_d340_return_output;
     -- n8_MUX[uxn_opcodes_h_l699_c7_8e76] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l699_c7_8e76_cond <= VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_cond;
     n8_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue;
     n8_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_return_output := n8_MUX_uxn_opcodes_h_l699_c7_8e76_return_output;

     -- t8_MUX[uxn_opcodes_h_l696_c7_5002] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l696_c7_5002_cond <= VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_cond;
     t8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue;
     t8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_return_output := t8_MUX_uxn_opcodes_h_l696_c7_5002_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l703_c37_c48f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l699_c7_8e76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_8e76] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_8e76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c7_9241] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l703_c37_c48f_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse := VAR_n8_MUX_uxn_opcodes_h_l699_c7_8e76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_8e76_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_8e76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l699_c7_8e76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_9241_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse := VAR_t8_MUX_uxn_opcodes_h_l696_c7_5002_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l696_c7_5002] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_return_output;

     -- t8_MUX[uxn_opcodes_h_l693_c7_9241] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l693_c7_9241_cond <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_cond;
     t8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue;
     t8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_return_output := t8_MUX_uxn_opcodes_h_l693_c7_9241_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l696_c7_5002] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l696_c7_5002] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_return_output;

     -- n8_MUX[uxn_opcodes_h_l696_c7_5002] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l696_c7_5002_cond <= VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_cond;
     n8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_iftrue;
     n8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_return_output := n8_MUX_uxn_opcodes_h_l696_c7_5002_return_output;

     -- MUX[uxn_opcodes_h_l703_c22_3d1d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l703_c22_3d1d_cond <= VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_cond;
     MUX_uxn_opcodes_h_l703_c22_3d1d_iftrue <= VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_iftrue;
     MUX_uxn_opcodes_h_l703_c22_3d1d_iffalse <= VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_return_output := MUX_uxn_opcodes_h_l703_c22_3d1d_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue := VAR_MUX_uxn_opcodes_h_l703_c22_3d1d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse := VAR_n8_MUX_uxn_opcodes_h_l696_c7_5002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_5002_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_5002_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_5002_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_t8_MUX_uxn_opcodes_h_l693_c7_9241_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_9241] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_return_output;

     -- t8_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     t8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     t8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_return_output := t8_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l699_c7_8e76] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_cond;
     result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_return_output := result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c7_9241] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_return_output;

     -- n8_MUX[uxn_opcodes_h_l693_c7_9241] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l693_c7_9241_cond <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_cond;
     n8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_iftrue;
     n8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_return_output := n8_MUX_uxn_opcodes_h_l693_c7_9241_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c7_9241] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_n8_MUX_uxn_opcodes_h_l693_c7_9241_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_9241_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_9241_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_9241_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l699_c7_8e76_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l680_c2_8047_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l696_c7_5002] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_cond;
     result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_return_output := result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_return_output;

     -- n8_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     n8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     n8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_return_output := n8_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l680_c2_8047_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l696_c7_5002_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l693_c7_9241] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_cond;
     result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_return_output := result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_9241_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l680_c2_8047] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_cond;
     result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_return_output := result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l707_l676_DUPLICATE_580b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l707_l676_DUPLICATE_580b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l680_c2_8047_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l680_c2_8047_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l707_l676_DUPLICATE_580b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l707_l676_DUPLICATE_580b_return_output;
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
