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
-- Submodules: 30
entity lit_0CLK_ac9ce6a4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_ac9ce6a4;
architecture arch of lit_0CLK_ac9ce6a4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l183_c6_0503]
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l183_c1_43f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l183_c2_9742]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l183_c2_9742]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l183_c2_9742]
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l183_c2_9742]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l183_c2_9742]
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l183_c2_9742]
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l183_c2_9742]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l183_c2_9742]
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l184_c3_39fd[uxn_opcodes_h_l184_c3_39fd]
signal printf_uxn_opcodes_h_l184_c3_39fd_uxn_opcodes_h_l184_c3_39fd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l190_c11_95ff]
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l190_c7_b62b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l190_c7_b62b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l190_c7_b62b]
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l190_c7_b62b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l190_c7_b62b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l190_c7_b62b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l190_c7_b62b]
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l193_c22_dee7]
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l195_c11_a98b]
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l195_c7_706c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l195_c7_706c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l195_c7_706c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l195_c7_706c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l195_c7_706c]
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l201_c11_ee9a]
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_c35f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_c35f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_14ff( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.u8_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503
BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_left,
BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_right,
BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742
result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_cond,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742
result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_cond,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output);

-- printf_uxn_opcodes_h_l184_c3_39fd_uxn_opcodes_h_l184_c3_39fd
printf_uxn_opcodes_h_l184_c3_39fd_uxn_opcodes_h_l184_c3_39fd : entity work.printf_uxn_opcodes_h_l184_c3_39fd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l184_c3_39fd_uxn_opcodes_h_l184_c3_39fd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff
BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_left,
BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_right,
BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b
result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b
result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_left,
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_right,
BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b
BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_left,
BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_right,
BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c
result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_cond,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a
BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_left,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_right,
BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_b89d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_9742_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l184_c3_39fd_uxn_opcodes_h_l184_c3_39fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l193_c3_4f37 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_b62b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_415d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l183_l195_DUPLICATE_5549_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_591a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_5c15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_985f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_59b3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_14ff_uxn_opcodes_h_l206_l179_DUPLICATE_a22f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_415d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l198_c3_415d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_b89d := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l186_c3_b89d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iftrue := VAR_previous_ram_read;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_985f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_985f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l201_c11_ee9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_591a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_591a_return_output := result.stack_address_sp_offset;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l183_c2_9742] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_9742_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l183_c6_0503] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_left;
     BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output := BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_5c15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_5c15_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l193_c22_dee7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l183_l195_DUPLICATE_5549 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l183_l195_DUPLICATE_5549_return_output := result.is_pc_updated;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l190_c7_b62b] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_b62b_return_output := result.is_sp_shift;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l190_c7_b62b] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_b62b_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l195_c11_a98b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_left;
     BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output := BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_59b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_59b3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l190_c11_95ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c6_0503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l190_c11_95ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l195_c11_a98b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c11_ee9a_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l193_c3_4f37 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l193_c22_dee7_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_59b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_59b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l201_l190_l195_DUPLICATE_59b3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l183_l195_DUPLICATE_5549_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l183_l195_DUPLICATE_5549_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_5c15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_5c15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l183_l201_l190_DUPLICATE_5c15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_591a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_591a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_591a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_985f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_985f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l183_l190_l195_DUPLICATE_985f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l190_c7_b62b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l183_c2_9742_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l190_c7_b62b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l193_c3_4f37;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l183_c1_43f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l195_c7_706c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l195_c7_706c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_return_output := result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l190_c7_b62b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output := result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l201_c7_c35f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l190_c7_b62b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l195_c7_706c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l183_c2_9742] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l201_c7_c35f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l184_c3_39fd_uxn_opcodes_h_l184_c3_39fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l183_c1_43f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c7_c35f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l195_c7_706c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c7_c35f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l195_c7_706c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l195_c7_706c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l190_c7_b62b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l183_c2_9742] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_cond;
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output := result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l195_c7_706c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l190_c7_b62b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output := result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l183_c2_9742] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l190_c7_b62b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l195_c7_706c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_return_output;

     -- printf_uxn_opcodes_h_l184_c3_39fd[uxn_opcodes_h_l184_c3_39fd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l184_c3_39fd_uxn_opcodes_h_l184_c3_39fd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l184_c3_39fd_uxn_opcodes_h_l184_c3_39fd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l195_c7_706c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l195_c7_706c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l183_c2_9742] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l183_c2_9742] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_cond;
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output := result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l190_c7_b62b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l183_c2_9742] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l190_c7_b62b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l190_c7_b62b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l183_c2_9742] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l183_c2_9742] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_14ff_uxn_opcodes_h_l206_l179_DUPLICATE_a22f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_14ff_uxn_opcodes_h_l206_l179_DUPLICATE_a22f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_14ff(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l183_c2_9742_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l183_c2_9742_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_14ff_uxn_opcodes_h_l206_l179_DUPLICATE_a22f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_14ff_uxn_opcodes_h_l206_l179_DUPLICATE_a22f_return_output;
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
