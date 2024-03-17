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
-- BIN_OP_EQ[uxn_opcodes_h_l110_c6_92e3]
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_962c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_962c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_962c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l110_c2_962c]
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_962c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_962c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_962c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_962c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l110_c2_962c]
signal tmp16_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_753e]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_fadb]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_fadb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_fadb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_fadb]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_d182]
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l126_c11_0ee6]
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l126_c7_a9d0]
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_a9d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_a9d0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l126_c7_a9d0]
signal tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l128_c3_ceb1]
signal CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l130_c11_c5fe]
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l130_c7_d7db]
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_d7db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_d7db]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l130_c7_d7db]
signal tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l131_c3_3a13]
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_7aae]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_7a7a]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_return_output : unsigned(17 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7d74( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3
BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_left,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_right,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c
result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_cond,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l110_c2_962c
tmp16_MUX_uxn_opcodes_h_l110_c2_962c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l110_c2_962c_cond,
tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iftrue,
tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iffalse,
tmp16_MUX_uxn_opcodes_h_l110_c2_962c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e
BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb
result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_fadb
tmp16_MUX_uxn_opcodes_h_l123_c7_fadb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_left,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_right,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6
BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_left,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_right,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0
result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_cond,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0
tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_cond,
tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output);

-- CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1
CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_x,
CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe
BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_left,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_right,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db
result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_cond,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l130_c7_d7db
tmp16_MUX_uxn_opcodes_h_l130_c7_d7db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_cond,
tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue,
tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse,
tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13
BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_left,
BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_right,
BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
 tmp16_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output,
 tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output,
 CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_return_output,
 tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_return_output,
 BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_9ccc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_962c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l124_c3_22ce : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l133_c3_c66e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5b93_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5dc1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_8ec9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_a18f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7d74_uxn_opcodes_h_l106_l137_DUPLICATE_c652_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_9ccc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_9ccc;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5b93 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5b93_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l126_c11_0ee6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_left;
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_return_output := BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5dc1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5dc1_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_8ec9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_8ec9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_962c_return_output := result.is_vram_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_962c_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_962c_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_962c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l130_c11_c5fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_962c_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_a18f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_a18f_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_753e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_d182] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_left;
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_return_output := BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l110_c6_92e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_92e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_753e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_0ee6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_c5fe_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l124_c3_22ce := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_d182_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_8ec9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_8ec9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_a18f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_a18f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5b93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5b93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5b93_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5dc1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5dc1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l126_l130_l123_DUPLICATE_5dc1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_962c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_962c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_962c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_962c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_962c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue := VAR_result_u16_value_uxn_opcodes_h_l124_c3_22ce;
     -- BIN_OP_OR[uxn_opcodes_h_l131_c3_3a13] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_left;
     BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_return_output := BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l128_c3_ceb1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_x <= VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_return_output := CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_d7db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_d7db] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_right := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_3a13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_ceb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_d7db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_d7db_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l130_c7_d7db] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_cond;
     tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue;
     tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_return_output := tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_7aae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_a9d0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_a9d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7aae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_d7db_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l126_c7_a9d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_cond;
     tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output := tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_7a7a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_fadb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_fadb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l133_c3_c66e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_7a7a_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_fadb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_fadb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue := VAR_result_u16_value_uxn_opcodes_h_l133_c3_c66e;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l130_c7_d7db] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_cond;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_return_output := result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l123_c7_fadb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_d7db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_fadb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l126_c7_a9d0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output := result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l110_c2_962c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_cond;
     tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_return_output := tmp16_MUX_uxn_opcodes_h_l110_c2_962c_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_a9d0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_962c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_fadb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_fadb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l110_c2_962c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_return_output := result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7d74_uxn_opcodes_h_l106_l137_DUPLICATE_c652 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7d74_uxn_opcodes_h_l106_l137_DUPLICATE_c652_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7d74(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_962c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_962c_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7d74_uxn_opcodes_h_l106_l137_DUPLICATE_c652_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7d74_uxn_opcodes_h_l106_l137_DUPLICATE_c652_return_output;
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
