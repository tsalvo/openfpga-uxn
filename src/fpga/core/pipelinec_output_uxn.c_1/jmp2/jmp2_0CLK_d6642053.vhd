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
-- Submodules: 35
entity jmp2_0CLK_d6642053 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_d6642053;
architecture arch of jmp2_0CLK_d6642053 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l623_c6_1e61]
signal BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l623_c2_60d5]
signal t16_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l623_c2_60d5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c2_60d5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l623_c2_60d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l623_c2_60d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c2_60d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l623_c2_60d5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l623_c2_60d5]
signal result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l623_c2_60d5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l623_c2_60d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l636_c11_56f9]
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l636_c7_08ce]
signal t16_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l636_c7_08ce]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l636_c7_08ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_08ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l636_c7_08ce]
signal result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l636_c7_08ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l639_c11_1fc9]
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l639_c7_d4b3]
signal t16_MUX_uxn_opcodes_h_l639_c7_d4b3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l639_c7_d4b3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l639_c7_d4b3]
signal result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l639_c7_d4b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_d4b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l641_c3_e097]
signal CONST_SL_8_uxn_opcodes_h_l641_c3_e097_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l641_c3_e097_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l643_c11_fbfd]
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l643_c7_4e40]
signal t16_MUX_uxn_opcodes_h_l643_c7_4e40_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l643_c7_4e40_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_4e40]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l643_c7_4e40]
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l643_c7_4e40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_4e40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l644_c3_82d4]
signal BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l645_c30_6fc9]
signal sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6a57( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61
BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_left,
BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_right,
BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output);

-- t16_MUX_uxn_opcodes_h_l623_c2_60d5
t16_MUX_uxn_opcodes_h_l623_c2_60d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l623_c2_60d5_cond,
t16_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue,
t16_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse,
t16_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5
result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5
result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5
result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5
result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_cond,
result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5
result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9
BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_left,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_right,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output);

-- t16_MUX_uxn_opcodes_h_l636_c7_08ce
t16_MUX_uxn_opcodes_h_l636_c7_08ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l636_c7_08ce_cond,
t16_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue,
t16_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse,
t16_MUX_uxn_opcodes_h_l636_c7_08ce_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce
result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_cond,
result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9
BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_left,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_right,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output);

-- t16_MUX_uxn_opcodes_h_l639_c7_d4b3
t16_MUX_uxn_opcodes_h_l639_c7_d4b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l639_c7_d4b3_cond,
t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue,
t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse,
t16_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3
result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_cond,
result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l641_c3_e097
CONST_SL_8_uxn_opcodes_h_l641_c3_e097 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l641_c3_e097_x,
CONST_SL_8_uxn_opcodes_h_l641_c3_e097_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd
BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_left,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_right,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output);

-- t16_MUX_uxn_opcodes_h_l643_c7_4e40
t16_MUX_uxn_opcodes_h_l643_c7_4e40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l643_c7_4e40_cond,
t16_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue,
t16_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse,
t16_MUX_uxn_opcodes_h_l643_c7_4e40_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40
result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_cond,
result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4
BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_left,
BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_right,
BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9
sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_ins,
sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_x,
sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_y,
sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output,
 t16_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output,
 t16_MUX_uxn_opcodes_h_l636_c7_08ce_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output,
 t16_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output,
 CONST_SL_8_uxn_opcodes_h_l641_c3_e097_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output,
 t16_MUX_uxn_opcodes_h_l643_c7_4e40_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_return_output,
 BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_return_output,
 sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l628_c3_7933 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l633_c3_1f65 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_5da5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l636_c7_08ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_e097_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_e097_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l639_l623_l643_l636_DUPLICATE_7114_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_4bc8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_59d9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_e378_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l640_l644_DUPLICATE_93cb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l651_l619_DUPLICATE_0d73_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l628_c3_7933 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l628_c3_7933;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l633_c3_1f65 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l633_c3_1f65;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_5da5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_5da5;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse := t16;
     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l623_c2_60d5_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l623_c2_60d5_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_4bc8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_4bc8_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_e378 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_e378_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l643_c11_fbfd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_left;
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output := BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l623_c6_1e61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_left;
     BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output := BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l639_l623_l643_l636_DUPLICATE_7114 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l639_l623_l643_l636_DUPLICATE_7114_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l639_c11_1fc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l645_c30_6fc9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_ins;
     sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_x;
     sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_return_output := sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l623_c2_60d5_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l636_c7_08ce] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l636_c7_08ce_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l623_c2_60d5_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_59d9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_59d9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l636_c11_56f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l640_l644_DUPLICATE_93cb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l640_l644_DUPLICATE_93cb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_1e61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_56f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_1fc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_fbfd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l640_l644_DUPLICATE_93cb_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_e097_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l640_l644_DUPLICATE_93cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_59d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_59d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_59d9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l639_l623_l643_l636_DUPLICATE_7114_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l639_l623_l643_l636_DUPLICATE_7114_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l639_l623_l643_l636_DUPLICATE_7114_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l639_l623_l643_l636_DUPLICATE_7114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_e378_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_e378_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_e378_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_4bc8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_4bc8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l639_l643_l636_DUPLICATE_4bc8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l623_c2_60d5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l623_c2_60d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l623_c2_60d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l623_c2_60d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l636_c7_08ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_6fc9_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l641_c3_e097] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l641_c3_e097_x <= VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_e097_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_e097_return_output := CONST_SL_8_uxn_opcodes_h_l641_c3_e097_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_4e40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l636_c7_08ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l644_c3_82d4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_left;
     BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_return_output := BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_4e40] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l643_c7_4e40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_82d4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_e097_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_4e40_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_4e40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_4e40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;
     -- t16_MUX[uxn_opcodes_h_l643_c7_4e40] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l643_c7_4e40_cond <= VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_cond;
     t16_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue;
     t16_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_return_output := t16_MUX_uxn_opcodes_h_l643_c7_4e40_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l639_c7_d4b3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_d4b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l643_c7_4e40] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_cond;
     result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_return_output := result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l639_c7_d4b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_4e40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l643_c7_4e40_return_output;
     -- t16_MUX[uxn_opcodes_h_l639_c7_d4b3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l639_c7_d4b3_cond <= VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_cond;
     t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue;
     t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output := t16_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_08ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l636_c7_08ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l639_c7_d4b3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output := result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l636_c7_08ce] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse := VAR_t16_MUX_uxn_opcodes_h_l639_c7_d4b3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l636_c7_08ce] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_cond;
     result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_return_output := result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l636_c7_08ce] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l636_c7_08ce_cond <= VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_cond;
     t16_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_iftrue;
     t16_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_return_output := t16_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l636_c7_08ce_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_return_output := result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l623_c2_60d5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l623_c2_60d5_cond <= VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_cond;
     t16_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_iftrue;
     t16_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_return_output := t16_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l623_c2_60d5_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l651_l619_DUPLICATE_0d73 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l651_l619_DUPLICATE_0d73_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a57(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_60d5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_60d5_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l651_l619_DUPLICATE_0d73_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l651_l619_DUPLICATE_0d73_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
