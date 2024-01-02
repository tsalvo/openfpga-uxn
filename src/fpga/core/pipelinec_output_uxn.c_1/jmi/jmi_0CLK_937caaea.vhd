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
-- BIN_OP_EQ[uxn_opcodes_h_l110_c6_b5d4]
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l110_c2_267b]
signal tmp16_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_267b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_267b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l110_c2_267b]
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_267b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_267b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_267b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_267b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_267b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_3719]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_c178]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_c178_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_c178_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_c178]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_c178]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_c178]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_a844]
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l126_c11_08e6]
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l126_c7_c2b9]
signal tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_c2b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l126_c7_c2b9]
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_c2b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l128_c3_89ce]
signal CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l130_c11_e327]
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l130_c7_4a1b]
signal tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_4a1b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l130_c7_4a1b]
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_4a1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l131_c3_565a]
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_99b8]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_2dc1]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_return_output : unsigned(17 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_565b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_vram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4
BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_left,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_right,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l110_c2_267b
tmp16_MUX_uxn_opcodes_h_l110_c2_267b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l110_c2_267b_cond,
tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iftrue,
tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iffalse,
tmp16_MUX_uxn_opcodes_h_l110_c2_267b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b
result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_cond,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719
BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_c178
tmp16_MUX_uxn_opcodes_h_l123_c7_c178 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_c178_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_c178_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178
result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_left,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_right,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6
BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_left,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_right,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9
tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_cond,
tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue,
tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse,
tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9
result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_cond,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output);

-- CONST_SL_8_uxn_opcodes_h_l128_c3_89ce
CONST_SL_8_uxn_opcodes_h_l128_c3_89ce : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_x,
CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327
BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_left,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_right,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_return_output);

-- tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b
tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_cond,
tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue,
tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse,
tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b
result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_cond,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l131_c3_565a
BIN_OP_OR_uxn_opcodes_h_l131_c3_565a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_left,
BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_right,
BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_c178_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_return_output,
 tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output,
 CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_return_output,
 tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_e2d4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_267b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l124_c3_bf85 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l133_c3_83b1 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_731c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_1ce1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_a4d3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_l126_DUPLICATE_71b4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_565b_uxn_opcodes_h_l137_l106_DUPLICATE_1a7a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_e2d4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_e2d4;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_l126_DUPLICATE_71b4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_l126_DUPLICATE_71b4_return_output := result.u16_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_267b_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_267b_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_a844] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_left;
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_return_output := BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l126_c11_08e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l130_c11_e327] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_left;
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_return_output := BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_a4d3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_a4d3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_3719] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_267b_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_267b_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_1ce1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_1ce1_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_267b_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l110_c6_b5d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_731c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_731c_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_b5d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_3719_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_08e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_e327_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l124_c3_bf85 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_a844_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_a4d3_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_a4d3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_l126_DUPLICATE_71b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l130_l126_DUPLICATE_71b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_1ce1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_1ce1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_1ce1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_731c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_731c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l130_l123_l126_DUPLICATE_731c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_267b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_267b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_267b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_267b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_267b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iftrue := VAR_result_u16_value_uxn_opcodes_h_l124_c3_bf85;
     -- BIN_OP_OR[uxn_opcodes_h_l131_c3_565a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_left;
     BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_return_output := BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l128_c3_89ce] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_x <= VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_return_output := CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_4a1b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_4a1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_right := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_565a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_89ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l130_c7_4a1b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_cond;
     tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output := tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_99b8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_c2b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_c2b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_99b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_2dc1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l126_c7_c2b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_cond;
     tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output := tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_c178] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_c178] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l133_c3_83b1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_2dc1_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_c178_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_c178_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l133_c3_83b1;
     -- tmp16_MUX[uxn_opcodes_h_l123_c7_c178] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_c178_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_c178_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l130_c7_4a1b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output := result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_4a1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_c178_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l126_c7_c2b9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output := result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l110_c2_267b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_cond;
     tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_return_output := tmp16_MUX_uxn_opcodes_h_l110_c2_267b_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_c2b9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_267b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_c178] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_c178_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l110_c2_267b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_return_output := result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_565b_uxn_opcodes_h_l137_l106_DUPLICATE_1a7a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_565b_uxn_opcodes_h_l137_l106_DUPLICATE_1a7a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_565b(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_267b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_267b_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_565b_uxn_opcodes_h_l137_l106_DUPLICATE_1a7a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_565b_uxn_opcodes_h_l137_l106_DUPLICATE_1a7a_return_output;
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
