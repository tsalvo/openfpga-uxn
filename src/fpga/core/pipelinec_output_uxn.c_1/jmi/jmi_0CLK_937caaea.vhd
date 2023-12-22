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
-- Submodules: 32
entity jmi_0CLK_937caaea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmi_0CLK_937caaea;
architecture arch of jmi_0CLK_937caaea is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l110_c6_f592]
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_e017]
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_e017]
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_e017]
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_e017]
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l110_c2_e017]
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_e017]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_e017]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_e017]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l110_c2_e017]
signal tmp16_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_20f9]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_2275]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_2275]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_2275]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_2275]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_2275_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_2275_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_9674]
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l126_c11_557a]
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_1d7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l126_c7_1d7a]
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_1d7a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l126_c7_1d7a]
signal tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l128_c3_d4c1]
signal CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l130_c11_522d]
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_5b27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l130_c7_5b27]
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_5b27]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l130_c7_5b27]
signal tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l131_c3_c98e]
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_9ff2]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_fd47]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_return_output : unsigned(17 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7a99( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_pc_updated := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592
BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_left,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_right,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017
result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_cond,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_return_output);

-- tmp16_MUX_uxn_opcodes_h_l110_c2_e017
tmp16_MUX_uxn_opcodes_h_l110_c2_e017 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l110_c2_e017_cond,
tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iftrue,
tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iffalse,
tmp16_MUX_uxn_opcodes_h_l110_c2_e017_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9
BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275
result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_2275
tmp16_MUX_uxn_opcodes_h_l123_c7_2275 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_2275_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_2275_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_left,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_right,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a
BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_left,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_right,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a
result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_cond,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a
tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_cond,
tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue,
tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse,
tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1
CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_x,
CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d
BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_left,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_right,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27
result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_cond,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_return_output);

-- tmp16_MUX_uxn_opcodes_h_l130_c7_5b27
tmp16_MUX_uxn_opcodes_h_l130_c7_5b27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_cond,
tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue,
tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse,
tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e
BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_left,
BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_right,
BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
 tmp16_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_2275_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output,
 tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output,
 CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_return_output,
 tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_return_output,
 BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_74df : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_e017_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l124_c3_2e55 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l133_c3_b86b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_6f3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_910d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_5c54_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_fa26_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7a99_uxn_opcodes_h_l106_l137_DUPLICATE_a15a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_74df := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_74df;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_5c54 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_5c54_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_e017_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_6f3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_6f3c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l126_c11_557a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_left;
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_return_output := BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_910d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_910d_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l130_c11_522d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_left;
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_return_output := BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_e017_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_9674] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_left;
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_return_output := BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_e017_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_fa26 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_fa26_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l110_c6_f592] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_left;
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output := BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_e017_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_e017_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_20f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_f592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_20f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_557a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_522d_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l124_c3_2e55 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_9674_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_5c54_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_5c54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_fa26_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_fa26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_6f3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_6f3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_6f3c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_910d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_910d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_910d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_e017_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_e017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_e017_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_e017_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_e017_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iftrue := VAR_result_u16_value_uxn_opcodes_h_l124_c3_2e55;
     -- CONST_SL_8[uxn_opcodes_h_l128_c3_d4c1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_x <= VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_return_output := CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l131_c3_c98e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_left;
     BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_return_output := BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_5b27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_5b27] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_right := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_c98e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_d4c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_5b27_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_5b27_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_1d7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_9ff2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l130_c7_5b27] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_cond;
     tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue;
     tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_return_output := tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_1d7a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9ff2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_5b27_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_2275] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_2275] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l126_c7_1d7a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_cond;
     tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output := tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_fd47] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l133_c3_b86b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_fd47_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_2275_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_2275_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue := VAR_result_u16_value_uxn_opcodes_h_l133_c3_b86b;
     -- tmp16_MUX[uxn_opcodes_h_l123_c7_2275] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_2275_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_2275_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l130_c7_5b27] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_cond;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_return_output := result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_5b27_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_2275_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l126_c7_1d7a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output := result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l110_c2_e017_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_cond;
     tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iftrue;
     tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_return_output := tmp16_MUX_uxn_opcodes_h_l110_c2_e017_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_1d7a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e017_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_2275] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_2275_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l110_c2_e017] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_cond;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_return_output := result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7a99_uxn_opcodes_h_l106_l137_DUPLICATE_a15a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7a99_uxn_opcodes_h_l106_l137_DUPLICATE_a15a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7a99(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e017_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e017_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7a99_uxn_opcodes_h_l106_l137_DUPLICATE_a15a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7a99_uxn_opcodes_h_l106_l137_DUPLICATE_a15a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
