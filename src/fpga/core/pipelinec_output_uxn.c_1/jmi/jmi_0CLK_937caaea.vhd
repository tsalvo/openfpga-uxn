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
-- BIN_OP_EQ[uxn_opcodes_h_l110_c6_a85c]
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l110_c2_3fc0]
signal tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_3fc0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l110_c2_3fc0]
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_3fc0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_3fc0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_3fc0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_3fc0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_3fc0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_3fc0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_b4c8]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_3aa1]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_3aa1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_3aa1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l123_c7_3aa1]
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_4f3b]
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l126_c11_14de]
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l126_c7_ddce]
signal tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_ddce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_ddce]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l126_c7_ddce]
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l128_c3_38fb]
signal CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l130_c11_36aa]
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l130_c7_3a73]
signal tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_3a73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_3a73]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l130_c7_3a73]
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l131_c3_4035]
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_1587]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_ee87]
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_return_output : unsigned(17 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fd91( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_stack_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c
BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_left,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_right,
BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0
tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_cond,
tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue,
tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse,
tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0
result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_cond,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8
BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1
tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1
result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_cond,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_left,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_right,
BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de
BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_left,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_right,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l126_c7_ddce
tmp16_MUX_uxn_opcodes_h_l126_c7_ddce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_cond,
tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue,
tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse,
tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce
result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_cond,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_return_output);

-- CONST_SL_8_uxn_opcodes_h_l128_c3_38fb
CONST_SL_8_uxn_opcodes_h_l128_c3_38fb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_x,
CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa
BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_left,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_right,
BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l130_c7_3a73
tmp16_MUX_uxn_opcodes_h_l130_c7_3a73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_cond,
tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue,
tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse,
tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73
result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_cond,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l131_c3_4035
BIN_OP_OR_uxn_opcodes_h_l131_c3_4035 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_left,
BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_right,
BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_left,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_right,
BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output,
 tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_return_output,
 tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_return_output,
 CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_return_output,
 tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_return_output,
 BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_5aef : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l124_c3_4bdf : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l133_c3_b06f : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_991c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_224f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_3d34_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_db2e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd91_uxn_opcodes_h_l137_l106_DUPLICATE_4233_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_5aef := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l116_c3_5aef;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse := tmp16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_224f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_224f_return_output := result.is_pc_updated;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l130_c11_36aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_b4c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l124_c22_4f3b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_991c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_991c_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_3d34 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_3d34_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_db2e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_db2e_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l110_c6_a85c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_left;
     BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output := BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l126_c11_14de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_left;
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_return_output := BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l110_c6_a85c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b4c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_14de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l130_c11_36aa_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l124_c3_4bdf := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l124_c22_4f3b_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_3d34_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l131_DUPLICATE_3d34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_db2e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l126_l130_DUPLICATE_db2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_991c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_991c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_991c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_224f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_224f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l126_l130_DUPLICATE_224f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l110_c2_3fc0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue := VAR_result_u16_value_uxn_opcodes_h_l124_c3_4bdf;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l130_c7_3a73] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l131_c3_4035] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_left;
     BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_return_output := BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l130_c7_3a73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l128_c3_38fb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_return_output := CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_right := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l131_c3_4035_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_38fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l130_c7_3a73_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l130_c7_3a73_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l130_c7_3a73] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_cond;
     tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue;
     tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_return_output := tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_ddce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_1587] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_ddce] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_1587_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_ddce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_ddce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l130_c7_3a73_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_3aa1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_3aa1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l126_c7_ddce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_cond;
     tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_return_output := tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l133_c23_ee87] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_left;
     BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_return_output := BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l133_c3_b06f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l133_c23_ee87_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_ddce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue := VAR_result_u16_value_uxn_opcodes_h_l133_c3_b06f;
     -- result_u16_value_MUX[uxn_opcodes_h_l130_c7_3a73] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_cond;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_return_output := result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l123_c7_3aa1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l130_c7_3a73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_cond;
     tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output := tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l126_c7_ddce] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_cond;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_return_output := result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l126_c7_ddce_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l123_c7_3aa1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output := result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l123_c7_3aa1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l110_c2_3fc0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output := result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fd91_uxn_opcodes_h_l137_l106_DUPLICATE_4233 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd91_uxn_opcodes_h_l137_l106_DUPLICATE_4233_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fd91(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l110_c2_3fc0_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd91_uxn_opcodes_h_l137_l106_DUPLICATE_4233_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd91_uxn_opcodes_h_l137_l106_DUPLICATE_4233_return_output;
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
