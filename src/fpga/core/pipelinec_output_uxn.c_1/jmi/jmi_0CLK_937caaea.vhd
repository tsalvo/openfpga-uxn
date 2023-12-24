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
-- BIN_OP_EQ[uxn_opcodes_h_l110_c6_018f]
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l110_c2_e111]
signal tmp16_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_e111]
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_e111]
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_e111]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_e111]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_e111]
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_e111]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l110_c2_e111]
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_e111]
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_7674]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_70ed]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_70ed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_70ed]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_70ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_17ac]
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l126_c11_6e60]
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l126_c7_121e]
signal tmp16_MUX_uxn_opcodes_h_l126_c7_121e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_121e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_121e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l126_c7_121e]
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_121e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l128_c3_b6dc]
signal CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l130_c11_17cc]
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l130_c7_1592]
signal tmp16_MUX_uxn_opcodes_h_l130_c7_1592_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_1592_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_1592]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l130_c7_1592]
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_1592]
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l131_c3_fdf5]
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_be63]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_8b1b]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_return_output : unsigned(17 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_03f7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_vram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f
BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_left,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_right,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l110_c2_e111
tmp16_MUX_uxn_opcodes_h_l110_c2_e111 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l110_c2_e111_cond,
tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iftrue,
tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iffalse,
tmp16_MUX_uxn_opcodes_h_l110_c2_e111_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111
result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_cond,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674
BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_70ed
tmp16_MUX_uxn_opcodes_h_l123_c7_70ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed
result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_left,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_right,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60
BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_left,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_right,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_return_output);

-- tmp16_MUX_uxn_opcodes_h_l126_c7_121e
tmp16_MUX_uxn_opcodes_h_l126_c7_121e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l126_c7_121e_cond,
tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iftrue,
tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iffalse,
tmp16_MUX_uxn_opcodes_h_l126_c7_121e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e
result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_cond,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc
CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_x,
CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc
BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_left,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_right,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l130_c7_1592
tmp16_MUX_uxn_opcodes_h_l130_c7_1592 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l130_c7_1592_cond,
tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iftrue,
tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iffalse,
tmp16_MUX_uxn_opcodes_h_l130_c7_1592_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592
result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_cond,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5
BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_left,
BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_right,
BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output,
 tmp16_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_return_output,
 tmp16_MUX_uxn_opcodes_h_l126_c7_121e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_return_output,
 CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_return_output,
 tmp16_MUX_uxn_opcodes_h_l130_c7_1592_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_return_output,
 BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_161d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_e111_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l124_c3_51e3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l133_c3_a0e0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_32e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_9d2b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_b20f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_bc91_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_03f7_uxn_opcodes_h_l106_l137_DUPLICATE_1eaa_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_161d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_161d;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_right := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_32e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_32e5_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_e111_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_7674] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_b20f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_b20f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_e111_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_bc91 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_bc91_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_9d2b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_9d2b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l130_c11_17cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_17ac] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_left;
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_return_output := BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_e111_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l110_c6_018f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_left;
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output := BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l126_c11_6e60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_left;
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_return_output := BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_e111_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_e111_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_018f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_7674_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_6e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_17cc_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l124_c3_51e3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_17ac_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_b20f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l131_l127_DUPLICATE_b20f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_bc91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_bc91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_9d2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_9d2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_9d2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_32e5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_32e5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_32e5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_e111_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_e111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_e111_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_e111_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_e111_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue := VAR_result_u16_value_uxn_opcodes_h_l124_c3_51e3;
     -- BIN_OP_OR[uxn_opcodes_h_l131_c3_fdf5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_left;
     BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_return_output := BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_1592] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_1592] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l128_c3_b6dc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_return_output := CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_right := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_fdf5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_b6dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_1592_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_1592_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_121e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_be63] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l130_c7_1592] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l130_c7_1592_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_cond;
     tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iftrue;
     tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_return_output := tmp16_MUX_uxn_opcodes_h_l130_c7_1592_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_121e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_be63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_121e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_121e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_1592_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_70ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_70ed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_8b1b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l126_c7_121e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l126_c7_121e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_cond;
     tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_return_output := tmp16_MUX_uxn_opcodes_h_l126_c7_121e_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l133_c3_a0e0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_8b1b_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_70ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_70ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_121e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iftrue := VAR_result_u16_value_uxn_opcodes_h_l133_c3_a0e0;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l123_c7_70ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l130_c7_1592] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_cond;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_return_output := result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_1592_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_70ed_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l126_c7_121e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_return_output := result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l110_c2_e111_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_cond;
     tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iftrue;
     tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_return_output := tmp16_MUX_uxn_opcodes_h_l110_c2_e111_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_121e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_e111_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_70ed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_70ed_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l110_c2_e111] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_cond;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_return_output := result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_03f7_uxn_opcodes_h_l106_l137_DUPLICATE_1eaa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_03f7_uxn_opcodes_h_l106_l137_DUPLICATE_1eaa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_03f7(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_e111_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_e111_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_03f7_uxn_opcodes_h_l106_l137_DUPLICATE_1eaa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_03f7_uxn_opcodes_h_l106_l137_DUPLICATE_1eaa_return_output;
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
