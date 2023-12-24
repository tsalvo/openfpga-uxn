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
-- Submodules: 28
entity jmp_0CLK_121b1df5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_121b1df5;
architecture arch of jmp_0CLK_121b1df5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : signed(7 downto 0) := to_signed(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : signed(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l592_c6_4001]
signal BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l592_c2_5533]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l592_c2_5533]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l592_c2_5533]
signal result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l592_c2_5533]
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c2_5533]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l592_c2_5533]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l592_c2_5533]
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l592_c2_5533]
signal result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l592_c2_5533]
signal result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l592_c2_5533]
signal t8_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c2_5533_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l605_c11_436b]
signal BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l605_c7_b76f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l605_c7_b76f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l605_c7_b76f]
signal result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l605_c7_b76f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l605_c7_b76f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l605_c7_b76f]
signal t8_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l608_c11_f998]
signal BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l608_c7_31e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l608_c7_31e6]
signal result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l608_c7_31e6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l608_c7_31e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l608_c7_31e6]
signal t8_MUX_uxn_opcodes_h_l608_c7_31e6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l608_c7_31e6_return_output : signed(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l610_c30_c3b1]
signal sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l612_c22_7a89]
signal BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
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
-- BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001
BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_left,
BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_right,
BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533
result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_cond,
result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533
result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533
result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533
result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533
result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

-- t8_MUX_uxn_opcodes_h_l592_c2_5533
t8_MUX_uxn_opcodes_h_l592_c2_5533 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l592_c2_5533_cond,
t8_MUX_uxn_opcodes_h_l592_c2_5533_iftrue,
t8_MUX_uxn_opcodes_h_l592_c2_5533_iffalse,
t8_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b
BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_left,
BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_right,
BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f
result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f
result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_cond,
result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f
result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f
result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_return_output);

-- t8_MUX_uxn_opcodes_h_l605_c7_b76f
t8_MUX_uxn_opcodes_h_l605_c7_b76f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l605_c7_b76f_cond,
t8_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue,
t8_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse,
t8_MUX_uxn_opcodes_h_l605_c7_b76f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998
BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_left,
BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_right,
BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6
result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_cond,
result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6
result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6
result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_return_output);

-- t8_MUX_uxn_opcodes_h_l608_c7_31e6
t8_MUX_uxn_opcodes_h_l608_c7_31e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l608_c7_31e6_cond,
t8_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue,
t8_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse,
t8_MUX_uxn_opcodes_h_l608_c7_31e6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1
sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_ins,
sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_x,
sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_y,
sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89
BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_left,
BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_right,
BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
 t8_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_return_output,
 t8_MUX_uxn_opcodes_h_l605_c7_b76f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_return_output,
 t8_MUX_uxn_opcodes_h_l608_c7_31e6_return_output,
 sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l602_c3_d2f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l597_c3_c440 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l606_c3_9233 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l605_c7_b76f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l612_c3_19a7 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l609_c8_1195_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l608_l592_l605_DUPLICATE_a9b7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_cc0b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_c8fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_408a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l616_l588_DUPLICATE_de1f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : signed(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l597_c3_c440 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l597_c3_c440;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l602_c3_d2f5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l602_c3_d2f5;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l606_c3_9233 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l606_c3_9233;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l605_c11_436b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_left;
     BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output := BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l608_l592_l605_DUPLICATE_a9b7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l608_l592_l605_DUPLICATE_a9b7_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l608_c11_f998] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_left;
     BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output := BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l592_c2_5533_return_output := result.is_stack_write;

     -- CAST_TO_int8_t[uxn_opcodes_h_l609_c8_1195] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l609_c8_1195_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l592_c2_5533_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_408a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_408a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l592_c6_4001] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_left;
     BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output := BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_cc0b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_cc0b_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l610_c30_c3b1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_ins;
     sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_x;
     sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_return_output := sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l592_c2_5533_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_c8fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_c8fe_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l592_c2_5533_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l605_c7_b76f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l605_c7_b76f_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c6_4001_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l605_c11_436b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l608_c11_f998_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l609_c8_1195_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l609_c8_1195_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_cc0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_cc0b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l608_l592_l605_DUPLICATE_a9b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l608_l592_l605_DUPLICATE_a9b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l608_l592_l605_DUPLICATE_a9b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_408a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_408a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_c8fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l608_l605_DUPLICATE_c8fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l592_c2_5533_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l592_c2_5533_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l592_c2_5533_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l592_c2_5533_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l605_c7_b76f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l610_c30_c3b1_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l608_c7_31e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l605_c7_b76f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output;

     -- t8_MUX[uxn_opcodes_h_l608_c7_31e6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l608_c7_31e6_cond <= VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_cond;
     t8_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue;
     t8_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_return_output := t8_MUX_uxn_opcodes_h_l608_c7_31e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l608_c7_31e6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l608_c7_31e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l612_c22_7a89] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_left;
     BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_return_output := BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l612_c3_19a7 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l612_c22_7a89_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l608_c7_31e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l608_c7_31e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l608_c7_31e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l608_c7_31e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue := VAR_result_u16_value_uxn_opcodes_h_l612_c3_19a7;
     -- result_u16_value_MUX[uxn_opcodes_h_l608_c7_31e6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_return_output := result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l605_c7_b76f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l605_c7_b76f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_return_output;

     -- t8_MUX[uxn_opcodes_h_l605_c7_b76f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l605_c7_b76f_cond <= VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_cond;
     t8_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue;
     t8_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_return_output := t8_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l605_c7_b76f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l608_c7_31e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_iffalse := VAR_t8_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;
     -- t8_MUX[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l592_c2_5533_cond <= VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_cond;
     t8_MUX_uxn_opcodes_h_l592_c2_5533_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_iftrue;
     t8_MUX_uxn_opcodes_h_l592_c2_5533_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_return_output := t8_MUX_uxn_opcodes_h_l592_c2_5533_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l605_c7_b76f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_return_output := result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_return_output;

     -- Submodule level 4
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l605_c7_b76f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l592_c2_5533_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l592_c2_5533] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_cond;
     result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_return_output := result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l616_l588_DUPLICATE_de1f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l616_l588_DUPLICATE_de1f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l592_c2_5533_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l616_l588_DUPLICATE_de1f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l616_l588_DUPLICATE_de1f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
