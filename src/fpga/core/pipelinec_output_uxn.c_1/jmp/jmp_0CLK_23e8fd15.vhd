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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 33
entity jmp_0CLK_23e8fd15 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_23e8fd15;
architecture arch of jmp_0CLK_23e8fd15 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l628_c6_0fe7]
signal BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l628_c2_9836]
signal t8_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l628_c2_9836_return_output : signed(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l628_c2_9836]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l628_c2_9836]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l628_c2_9836]
signal result_pc_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l628_c2_9836_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l628_c2_9836]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l628_c2_9836]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l628_c2_9836]
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l633_c11_61dd]
signal BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l633_c7_e459]
signal t8_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l633_c7_e459_return_output : signed(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l633_c7_e459]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l633_c7_e459]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l633_c7_e459]
signal result_pc_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l633_c7_e459]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l633_c7_e459]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l633_c7_e459]
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l636_c11_3c51]
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l636_c7_a66e]
signal t8_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : signed(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l636_c7_a66e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l636_c7_a66e]
signal result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l636_c7_a66e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l636_c7_a66e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_a66e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l639_c32_b3a0]
signal BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l639_c32_9559]
signal BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l639_c32_e359]
signal MUX_uxn_opcodes_h_l639_c32_e359_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l639_c32_e359_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l639_c32_e359_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l639_c32_e359_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l641_c15_cdb1]
signal BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l643_c11_634f]
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l643_c7_9652]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_9652]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_9652]
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f07d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7
BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_left,
BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_right,
BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output);

-- t8_MUX_uxn_opcodes_h_l628_c2_9836
t8_MUX_uxn_opcodes_h_l628_c2_9836 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l628_c2_9836_cond,
t8_MUX_uxn_opcodes_h_l628_c2_9836_iftrue,
t8_MUX_uxn_opcodes_h_l628_c2_9836_iffalse,
t8_MUX_uxn_opcodes_h_l628_c2_9836_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_return_output);

-- result_pc_MUX_uxn_opcodes_h_l628_c2_9836
result_pc_MUX_uxn_opcodes_h_l628_c2_9836 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l628_c2_9836_cond,
result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iftrue,
result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iffalse,
result_pc_MUX_uxn_opcodes_h_l628_c2_9836_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836
result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836
result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd
BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_left,
BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_right,
BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output);

-- t8_MUX_uxn_opcodes_h_l633_c7_e459
t8_MUX_uxn_opcodes_h_l633_c7_e459 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l633_c7_e459_cond,
t8_MUX_uxn_opcodes_h_l633_c7_e459_iftrue,
t8_MUX_uxn_opcodes_h_l633_c7_e459_iffalse,
t8_MUX_uxn_opcodes_h_l633_c7_e459_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_return_output);

-- result_pc_MUX_uxn_opcodes_h_l633_c7_e459
result_pc_MUX_uxn_opcodes_h_l633_c7_e459 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l633_c7_e459_cond,
result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iftrue,
result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iffalse,
result_pc_MUX_uxn_opcodes_h_l633_c7_e459_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459
result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51
BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_left,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_right,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output);

-- t8_MUX_uxn_opcodes_h_l636_c7_a66e
t8_MUX_uxn_opcodes_h_l636_c7_a66e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l636_c7_a66e_cond,
t8_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue,
t8_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse,
t8_MUX_uxn_opcodes_h_l636_c7_a66e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l636_c7_a66e
result_pc_MUX_uxn_opcodes_h_l636_c7_a66e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_cond,
result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue,
result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse,
result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0
BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_left,
BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_right,
BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l639_c32_9559
BIN_OP_GT_uxn_opcodes_h_l639_c32_9559 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_left,
BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_right,
BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_return_output);

-- MUX_uxn_opcodes_h_l639_c32_e359
MUX_uxn_opcodes_h_l639_c32_e359 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l639_c32_e359_cond,
MUX_uxn_opcodes_h_l639_c32_e359_iftrue,
MUX_uxn_opcodes_h_l639_c32_e359_iffalse,
MUX_uxn_opcodes_h_l639_c32_e359_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1
BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_left,
BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_right,
BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f
BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_left,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_right,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output,
 t8_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
 result_pc_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output,
 t8_MUX_uxn_opcodes_h_l633_c7_e459_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_return_output,
 result_pc_MUX_uxn_opcodes_h_l633_c7_e459_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output,
 t8_MUX_uxn_opcodes_h_l636_c7_a66e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output,
 result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_return_output,
 MUX_uxn_opcodes_h_l639_c32_e359_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_674c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_e3b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l633_c7_e459_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l641_c3_d3fd : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l637_c8_3444_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l639_c32_e359_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l639_c32_e359_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l639_c32_e359_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l639_c32_e359_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_3e7c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_c6c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_2848_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_b189_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l633_l643_l636_DUPLICATE_99f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l649_l624_DUPLICATE_4849_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_e3b2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_e3b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l639_c32_e359_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l639_c32_e359_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_674c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_674c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_right := to_unsigned(2, 2);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l633_l643_l636_DUPLICATE_99f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l633_l643_l636_DUPLICATE_99f3_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_c6c8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_c6c8_return_output := result.pc;

     -- BIN_OP_AND[uxn_opcodes_h_l639_c32_b3a0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_left;
     BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_return_output := BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l633_c11_61dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l636_c11_3c51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_left;
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output := BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l643_c11_634f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_left;
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_return_output := BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l633_c7_e459] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l633_c7_e459_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l628_c6_0fe7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_left;
     BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output := BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_3e7c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_3e7c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_b189 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_b189_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_2848 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_2848_return_output := result.is_pc_updated;

     -- CAST_TO_int8_t[uxn_opcodes_h_l637_c8_3444] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l637_c8_3444_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_left := VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b3a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_0fe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_61dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_3c51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_634f_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l637_c8_3444_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l637_c8_3444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_3e7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_3e7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_3e7c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_c6c8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_c6c8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l633_l628_l636_DUPLICATE_c6c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l633_l643_l636_DUPLICATE_99f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l633_l643_l636_DUPLICATE_99f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l633_l643_l636_DUPLICATE_99f3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_2848_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_2848_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_2848_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_b189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_b189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l633_l628_l643_DUPLICATE_b189_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l633_c7_e459_return_output;
     -- t8_MUX[uxn_opcodes_h_l636_c7_a66e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l636_c7_a66e_cond <= VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_cond;
     t8_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue;
     t8_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_return_output := t8_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l633_c7_e459] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l639_c32_9559] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_left;
     BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_return_output := BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_9652] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l643_c7_9652] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l641_c15_cdb1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_9652] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l639_c32_e359_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_9559_return_output;
     VAR_result_pc_uxn_opcodes_h_l641_c3_d3fd := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_cdb1_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9652_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9652_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9652_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_e459_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_iffalse := VAR_t8_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue := VAR_result_pc_uxn_opcodes_h_l641_c3_d3fd;
     -- MUX[uxn_opcodes_h_l639_c32_e359] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l639_c32_e359_cond <= VAR_MUX_uxn_opcodes_h_l639_c32_e359_cond;
     MUX_uxn_opcodes_h_l639_c32_e359_iftrue <= VAR_MUX_uxn_opcodes_h_l639_c32_e359_iftrue;
     MUX_uxn_opcodes_h_l639_c32_e359_iffalse <= VAR_MUX_uxn_opcodes_h_l639_c32_e359_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l639_c32_e359_return_output := MUX_uxn_opcodes_h_l639_c32_e359_return_output;

     -- t8_MUX[uxn_opcodes_h_l633_c7_e459] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l633_c7_e459_cond <= VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_cond;
     t8_MUX_uxn_opcodes_h_l633_c7_e459_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_iftrue;
     t8_MUX_uxn_opcodes_h_l633_c7_e459_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_return_output := t8_MUX_uxn_opcodes_h_l633_c7_e459_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l636_c7_a66e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_a66e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l628_c2_9836] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l636_c7_a66e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_cond;
     result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_return_output := result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l636_c7_a66e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue := VAR_MUX_uxn_opcodes_h_l639_c32_e359_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_iffalse := VAR_t8_MUX_uxn_opcodes_h_l633_c7_e459_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l633_c7_e459] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l633_c7_e459] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l636_c7_a66e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;

     -- t8_MUX[uxn_opcodes_h_l628_c2_9836] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l628_c2_9836_cond <= VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_cond;
     t8_MUX_uxn_opcodes_h_l628_c2_9836_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_iftrue;
     t8_MUX_uxn_opcodes_h_l628_c2_9836_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_return_output := t8_MUX_uxn_opcodes_h_l628_c2_9836_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l633_c7_e459] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l633_c7_e459_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_cond;
     result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iftrue;
     result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_return_output := result_pc_MUX_uxn_opcodes_h_l633_c7_e459_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l633_c7_e459] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_e459_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_e459_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_e459_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_a66e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l628_c2_9836_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l628_c2_9836] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l628_c2_9836] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l628_c2_9836] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l633_c7_e459] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l628_c2_9836] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l628_c2_9836_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_cond;
     result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iftrue;
     result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_return_output := result_pc_MUX_uxn_opcodes_h_l628_c2_9836_return_output;

     -- Submodule level 5
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_e459_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l628_c2_9836] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l649_l624_DUPLICATE_4849 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l649_l624_DUPLICATE_4849_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f07d(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_9836_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_9836_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l649_l624_DUPLICATE_4849_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l649_l624_DUPLICATE_4849_return_output;
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
