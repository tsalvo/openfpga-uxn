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
-- BIN_OP_EQ[uxn_opcodes_h_l110_c6_4387]
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_2c6e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l110_c2_2c6e]
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_2c6e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_2c6e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_2c6e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_2c6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_2c6e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_2c6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l110_c2_2c6e]
signal tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_5c77]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_1532]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_1532]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_1532]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_1532]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_1532_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_1532_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_1a15]
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l126_c11_8ddf]
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l126_c7_e8d9]
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_e8d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_e8d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l126_c7_e8d9]
signal tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l128_c3_e04f]
signal CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l130_c11_99ce]
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l130_c7_6d37]
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_6d37]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_6d37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l130_c7_6d37]
signal tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l131_c3_abe5]
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_68fa]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_9cb6]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_return_output : unsigned(17 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8d2c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_index_flipped := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387
BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_left,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_right,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e
result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_cond,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e
tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_cond,
tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue,
tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse,
tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77
BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532
result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_1532
tmp16_MUX_uxn_opcodes_h_l123_c7_1532 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_1532_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_1532_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_left,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_right,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf
BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_left,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_right,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9
result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_cond,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9
tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_cond,
tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output);

-- CONST_SL_8_uxn_opcodes_h_l128_c3_e04f
CONST_SL_8_uxn_opcodes_h_l128_c3_e04f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_x,
CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce
BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_left,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_right,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37
result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_cond,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_return_output);

-- tmp16_MUX_uxn_opcodes_h_l130_c7_6d37
tmp16_MUX_uxn_opcodes_h_l130_c7_6d37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_cond,
tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue,
tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse,
tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5
BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_left,
BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_right,
BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
 tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_1532_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output,
 CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_return_output,
 tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_return_output,
 BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_c97f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l124_c3_3be8 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l133_c3_377a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_ccab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_05f4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_c45e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_0c75_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d2c_uxn_opcodes_h_l137_l106_DUPLICATE_62c5_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_c97f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_c97f;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_right := to_unsigned(2, 2);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l126_c11_8ddf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_left;
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_return_output := BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_05f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_05f4_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_1a15] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_left;
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_return_output := BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l110_c6_4387] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_left;
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output := BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l130_c11_99ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_0c75 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_0c75_return_output := result.u16_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_5c77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_c45e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_c45e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_ccab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_ccab_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_4387_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_5c77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_8ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_99ce_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l124_c3_3be8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_1a15_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_c45e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_c45e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_0c75_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_0c75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_05f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_05f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_05f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_ccab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_ccab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_ccab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_2c6e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iftrue := VAR_result_u16_value_uxn_opcodes_h_l124_c3_3be8;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_6d37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l131_c3_abe5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_left;
     BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_return_output := BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_6d37] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l128_c3_e04f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_return_output := CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_right := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_abe5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e04f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_6d37_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_6d37_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_e8d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_e8d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_68fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l130_c7_6d37] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_cond;
     tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue;
     tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_return_output := tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_68fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_6d37_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_1532] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_1532] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_9cb6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l126_c7_e8d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_cond;
     tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output := tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l133_c3_377a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_9cb6_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_1532_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_1532_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue := VAR_result_u16_value_uxn_opcodes_h_l133_c3_377a;
     -- result_u16_value_MUX[uxn_opcodes_h_l130_c7_6d37] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_cond;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_return_output := result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l123_c7_1532] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_1532_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_1532_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_6d37_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_1532_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l126_c7_e8d9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output := result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_cond;
     tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output := tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_e8d9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_1532] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_1532_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l110_c2_2c6e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output := result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8d2c_uxn_opcodes_h_l137_l106_DUPLICATE_62c5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d2c_uxn_opcodes_h_l137_l106_DUPLICATE_62c5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8d2c(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_2c6e_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d2c_uxn_opcodes_h_l137_l106_DUPLICATE_62c5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d2c_uxn_opcodes_h_l137_l106_DUPLICATE_62c5_return_output;
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
