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
-- Submodules: 31
entity dup_0CLK_d0ab213f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup_0CLK_d0ab213f;
architecture arch of dup_0CLK_d0ab213f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2717_c6_752f]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2717_c2_0ef2]
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c2_0ef2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c2_0ef2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c2_0ef2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c2_0ef2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2717_c2_0ef2]
signal t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_c21f]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_99c5]
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2724_c7_99c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_99c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_99c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_99c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2724_c7_99c5]
signal t8_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2726_c30_db68]
signal sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_ff5b]
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2728_c7_622c]
signal result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2728_c7_622c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2728_c7_622c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2728_c7_622c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2728_c7_622c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2728_c7_622c]
signal t8_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_9c57]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_b152]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_b152]
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2735_c7_b152]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_b152]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_88fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_77dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2739_c7_77dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f
BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2
result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output);

-- t8_MUX_uxn_opcodes_h_l2717_c2_0ef2
t8_MUX_uxn_opcodes_h_l2717_c2_0ef2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond,
t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue,
t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse,
t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output);

-- t8_MUX_uxn_opcodes_h_l2724_c7_99c5
t8_MUX_uxn_opcodes_h_l2724_c7_99c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2724_c7_99c5_cond,
t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue,
t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse,
t8_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2726_c30_db68
sp_relative_shift_uxn_opcodes_h_l2726_c30_db68 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_ins,
sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_x,
sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_y,
sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_left,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_right,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c
result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_return_output);

-- t8_MUX_uxn_opcodes_h_l2728_c7_622c
t8_MUX_uxn_opcodes_h_l2728_c7_622c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2728_c7_622c_cond,
t8_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue,
t8_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse,
t8_MUX_uxn_opcodes_h_l2728_c7_622c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_cond,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output,
 t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output,
 t8_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output,
 sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_return_output,
 t8_MUX_uxn_opcodes_h_l2728_c7_622c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_1cd3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2730_c3_164a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_2fbc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2717_l2735_l2724_DUPLICATE_2bfc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2717_l2735_l2724_DUPLICATE_8aa7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2728_l2717_DUPLICATE_487d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2728_l2735_l2724_DUPLICATE_5e9a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2728_l2735_l2724_DUPLICATE_6dfb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2713_l2744_DUPLICATE_4534_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_2fbc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_2fbc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2730_c3_164a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2730_c3_164a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_1cd3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_1cd3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_ff5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2728_l2735_l2724_DUPLICATE_5e9a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2728_l2735_l2724_DUPLICATE_5e9a_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2726_c30_db68] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_ins;
     sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_x;
     sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_return_output := sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2728_l2717_DUPLICATE_487d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2728_l2717_DUPLICATE_487d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2728_l2735_l2724_DUPLICATE_6dfb LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2728_l2735_l2724_DUPLICATE_6dfb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_9c57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2717_l2735_l2724_DUPLICATE_8aa7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2717_l2735_l2724_DUPLICATE_8aa7_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c6_752f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_c21f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_88fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2717_l2735_l2724_DUPLICATE_2bfc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2717_l2735_l2724_DUPLICATE_2bfc_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_752f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_c21f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_ff5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_9c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_88fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2728_l2717_DUPLICATE_487d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2728_l2717_DUPLICATE_487d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2728_l2735_l2724_DUPLICATE_5e9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2728_l2735_l2724_DUPLICATE_5e9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2728_l2735_l2724_DUPLICATE_5e9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2728_l2735_l2724_DUPLICATE_5e9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2717_l2735_l2724_DUPLICATE_8aa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2717_l2735_l2724_DUPLICATE_8aa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2717_l2735_l2724_DUPLICATE_8aa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2717_l2735_l2724_DUPLICATE_8aa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2728_l2735_l2724_DUPLICATE_6dfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2728_l2735_l2724_DUPLICATE_6dfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2728_l2735_l2724_DUPLICATE_6dfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2717_l2735_l2724_DUPLICATE_2bfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2717_l2735_l2724_DUPLICATE_2bfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2717_l2735_l2724_DUPLICATE_2bfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2726_c30_db68_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_b152] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_b152] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_return_output := result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2728_c7_622c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_77dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output;

     -- t8_MUX[uxn_opcodes_h_l2728_c7_622c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2728_c7_622c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_cond;
     t8_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue;
     t8_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_return_output := t8_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2739_c7_77dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_77dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_b152_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_b152_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2728_c7_622c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_99c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_b152] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_return_output;

     -- t8_MUX[uxn_opcodes_h_l2724_c7_99c5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2724_c7_99c5_cond <= VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_cond;
     t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue;
     t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output := t8_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2735_c7_b152] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2728_c7_622c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_b152_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_b152_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2728_c7_622c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2717_c2_0ef2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond;
     t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue;
     t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output := t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_99c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2728_c7_622c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c2_0ef2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_99c5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_622c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2717_c2_0ef2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_99c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2724_c7_99c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c2_0ef2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_99c5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c2_0ef2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c2_0ef2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2713_l2744_DUPLICATE_4534 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2713_l2744_DUPLICATE_4534_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_0ef2_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2713_l2744_DUPLICATE_4534_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2713_l2744_DUPLICATE_4534_return_output;
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
