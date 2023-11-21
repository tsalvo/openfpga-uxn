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
entity lit_0CLK_393f0be6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_393f0be6;
architecture arch of lit_0CLK_393f0be6 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l189_c6_b870]
signal BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l189_c2_7ee8]
signal result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l189_c2_7ee8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l189_c2_7ee8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l189_c2_7ee8]
signal result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l189_c2_7ee8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l189_c2_7ee8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l189_c2_7ee8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l189_c2_7ee8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l198_c11_8b81]
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l198_c7_4b3b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l198_c7_4b3b]
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_4b3b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_4b3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l198_c7_4b3b]
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_4b3b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_4b3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l201_c22_9a00]
signal BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l203_c11_136d]
signal BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l203_c7_3f3b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l203_c7_3f3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l203_c7_3f3b]
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l203_c7_3f3b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l203_c7_3f3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l209_c11_89c8]
signal BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l209_c7_7e86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l209_c7_7e86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_7d3c( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870
BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_left,
BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_right,
BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8
result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond,
result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8
result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8
result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond,
result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8
result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8
result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8
result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81
BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_left,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_right,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b
result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b
result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00
BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_left,
BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_right,
BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d
BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_left,
BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_right,
BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b
result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_cond,
result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8
BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_left,
BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_right,
BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86
result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86
result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_8271 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l189_c2_7ee8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l201_c3_7178 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_4b3b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l206_c3_2c1b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l203_l189_DUPLICATE_9d57_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_ff46_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l189_l209_DUPLICATE_f9e8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_b2cb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_l209_DUPLICATE_f55b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7d3c_uxn_opcodes_h_l185_l214_DUPLICATE_daaa_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l206_c3_2c1b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l206_c3_2c1b;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_8271 := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_8271;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_right := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue := VAR_previous_ram_read;
     -- BIN_OP_EQ[uxn_opcodes_h_l198_c11_8b81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_left;
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output := BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l189_c6_b870] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_left;
     BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output := BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_b2cb LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_b2cb_return_output := result.stack_address_sp_offset;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l198_c7_4b3b] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_4b3b_return_output := result.u16_value;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l198_c7_4b3b] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_4b3b_return_output := result.is_sp_shift;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l189_c2_7ee8] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l189_c2_7ee8_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_l209_DUPLICATE_f55b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_l209_DUPLICATE_f55b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_ff46 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_ff46_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l203_l189_DUPLICATE_9d57 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l203_l189_DUPLICATE_9d57_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l189_l209_DUPLICATE_f9e8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l189_l209_DUPLICATE_f9e8_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l203_c11_136d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_left;
     BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output := BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l209_c11_89c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l201_c22_9a00] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_left;
     BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_return_output := BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_b870_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_8b81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l203_c11_136d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_89c8_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l201_c3_7178 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l201_c22_9a00_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_l209_DUPLICATE_f55b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_l209_DUPLICATE_f55b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l203_l209_DUPLICATE_f55b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l203_l189_DUPLICATE_9d57_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l203_l189_DUPLICATE_9d57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l189_l209_DUPLICATE_f9e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l189_l209_DUPLICATE_f9e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l189_l209_DUPLICATE_f9e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_b2cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_b2cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_b2cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_ff46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_ff46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l203_l189_DUPLICATE_ff46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_4b3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l189_c2_7ee8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_4b3b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l201_c3_7178;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l189_c2_7ee8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l203_c7_3f3b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output := result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l198_c7_4b3b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l209_c7_7e86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l203_c7_3f3b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l198_c7_4b3b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output := result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l209_c7_7e86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l203_c7_3f3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_7e86_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_7e86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l203_c7_3f3b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l189_c2_7ee8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output := result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l189_c2_7ee8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l198_c7_4b3b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output := result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_4b3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l203_c7_3f3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_4b3b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l203_c7_3f3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l189_c2_7ee8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l189_c2_7ee8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output := result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_4b3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_4b3b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l189_c2_7ee8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b3b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l189_c2_7ee8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l189_c2_7ee8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7d3c_uxn_opcodes_h_l185_l214_DUPLICATE_daaa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7d3c_uxn_opcodes_h_l185_l214_DUPLICATE_daaa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7d3c(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_7ee8_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7d3c_uxn_opcodes_h_l185_l214_DUPLICATE_daaa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7d3c_uxn_opcodes_h_l185_l214_DUPLICATE_daaa_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
