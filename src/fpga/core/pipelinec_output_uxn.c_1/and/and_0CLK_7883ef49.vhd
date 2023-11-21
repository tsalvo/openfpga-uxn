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
-- Submodules: 37
entity and_0CLK_7883ef49 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_7883ef49;
architecture arch of and_0CLK_7883ef49 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l851_c6_ce6a]
signal BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c2_1a95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c2_1a95]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l851_c2_1a95]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l851_c2_1a95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l851_c2_1a95]
signal result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c2_1a95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l851_c2_1a95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l851_c2_1a95]
signal t8_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l851_c2_1a95]
signal n8_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l859_c11_a87a]
signal BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l859_c7_ed86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l859_c7_ed86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l859_c7_ed86]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l859_c7_ed86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l859_c7_ed86]
signal result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l859_c7_ed86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l859_c7_ed86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l859_c7_ed86]
signal t8_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l859_c7_ed86]
signal n8_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l862_c30_ae5a]
signal sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l864_c11_b489]
signal BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l864_c7_bf42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l864_c7_bf42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l864_c7_bf42]
signal result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l864_c7_bf42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l864_c7_bf42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l864_c7_bf42]
signal t8_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l864_c7_bf42]
signal n8_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l866_c18_5548]
signal CONST_SR_8_uxn_opcodes_h_l866_c18_5548_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l866_c18_5548_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l870_c21_2952]
signal BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l872_c11_8990]
signal BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l872_c7_671a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l872_c7_671a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_stack_operation_16bit := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a
BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_left,
BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_right,
BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95
result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95
result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_cond,
result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95
result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_return_output);

-- t8_MUX_uxn_opcodes_h_l851_c2_1a95
t8_MUX_uxn_opcodes_h_l851_c2_1a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l851_c2_1a95_cond,
t8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue,
t8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse,
t8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output);

-- n8_MUX_uxn_opcodes_h_l851_c2_1a95
n8_MUX_uxn_opcodes_h_l851_c2_1a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l851_c2_1a95_cond,
n8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue,
n8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse,
n8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a
BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_left,
BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_right,
BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86
result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86
result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86
result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_cond,
result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86
result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86
result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_return_output);

-- t8_MUX_uxn_opcodes_h_l859_c7_ed86
t8_MUX_uxn_opcodes_h_l859_c7_ed86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l859_c7_ed86_cond,
t8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue,
t8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse,
t8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output);

-- n8_MUX_uxn_opcodes_h_l859_c7_ed86
n8_MUX_uxn_opcodes_h_l859_c7_ed86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l859_c7_ed86_cond,
n8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue,
n8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse,
n8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output);

-- sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a
sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_ins,
sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_x,
sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_y,
sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489
BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_left,
BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_right,
BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42
result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42
result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42
result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_cond,
result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42
result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_return_output);

-- t8_MUX_uxn_opcodes_h_l864_c7_bf42
t8_MUX_uxn_opcodes_h_l864_c7_bf42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l864_c7_bf42_cond,
t8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue,
t8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse,
t8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output);

-- n8_MUX_uxn_opcodes_h_l864_c7_bf42
n8_MUX_uxn_opcodes_h_l864_c7_bf42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l864_c7_bf42_cond,
n8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue,
n8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse,
n8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output);

-- CONST_SR_8_uxn_opcodes_h_l866_c18_5548
CONST_SR_8_uxn_opcodes_h_l866_c18_5548 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l866_c18_5548_x,
CONST_SR_8_uxn_opcodes_h_l866_c18_5548_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l870_c21_2952
BIN_OP_AND_uxn_opcodes_h_l870_c21_2952 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_left,
BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_right,
BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990
BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_left,
BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_right,
BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a
result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a
result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
 t8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
 n8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_return_output,
 t8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output,
 n8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output,
 sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_return_output,
 t8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output,
 n8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output,
 CONST_SR_8_uxn_opcodes_h_l866_c18_5548_return_output,
 BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l856_c3_1f76 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l859_c7_ed86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_6d28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l865_c8_bc18_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l866_c18_5548_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l866_c18_5548_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l866_c8_8c72_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l851_l864_DUPLICATE_8e7f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l864_l851_l859_DUPLICATE_c265_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l851_l859_DUPLICATE_d278_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l851_l859_l872_DUPLICATE_bed1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l864_l859_DUPLICATE_7b10_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l864_l859_l872_DUPLICATE_7718_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l877_l847_DUPLICATE_9b8d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l856_c3_1f76 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l856_c3_1f76;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_6d28 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l869_c3_6d28;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l866_c18_5548_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l864_l851_l859_DUPLICATE_c265 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l864_l851_l859_DUPLICATE_c265_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l864_c11_b489] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_left;
     BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output := BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l872_c11_8990] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_left;
     BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_return_output := BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l851_l859_DUPLICATE_d278 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l851_l859_DUPLICATE_d278_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l851_l864_DUPLICATE_8e7f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l851_l864_DUPLICATE_8e7f_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l862_c30_ae5a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_ins;
     sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_x;
     sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_return_output := sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_return_output;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l859_c7_ed86] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l859_c7_ed86_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l864_l859_l872_DUPLICATE_7718 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l864_l859_l872_DUPLICATE_7718_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l859_c11_a87a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_left;
     BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output := BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l865_c8_bc18] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l865_c8_bc18_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l851_l859_l872_DUPLICATE_bed1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l851_l859_l872_DUPLICATE_bed1_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l864_l859_DUPLICATE_7b10 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l864_l859_DUPLICATE_7b10_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l851_c6_ce6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l866_c18_5548] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l866_c18_5548_x <= VAR_CONST_SR_8_uxn_opcodes_h_l866_c18_5548_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l866_c18_5548_return_output := CONST_SR_8_uxn_opcodes_h_l866_c18_5548_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c6_ce6a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_a87a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c11_b489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l872_c11_8990_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_right := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l865_c8_bc18_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l865_c8_bc18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l851_l859_DUPLICATE_d278_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l851_l859_DUPLICATE_d278_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l864_l859_l872_DUPLICATE_7718_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l864_l859_l872_DUPLICATE_7718_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l864_l859_l872_DUPLICATE_7718_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l851_l864_DUPLICATE_8e7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l851_l864_DUPLICATE_8e7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l851_l859_l872_DUPLICATE_bed1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l851_l859_l872_DUPLICATE_bed1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l851_l859_l872_DUPLICATE_bed1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l864_l859_DUPLICATE_7b10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l864_l859_DUPLICATE_7b10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l864_l851_l859_DUPLICATE_c265_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l864_l851_l859_DUPLICATE_c265_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l864_l851_l859_DUPLICATE_c265_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l859_c7_ed86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_ae5a_return_output;
     -- t8_MUX[uxn_opcodes_h_l864_c7_bf42] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l864_c7_bf42_cond <= VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_cond;
     t8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue;
     t8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output := t8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l864_c7_bf42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l864_c7_bf42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l872_c7_671a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l866_c8_8c72] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l866_c8_8c72_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l866_c18_5548_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l872_c7_671a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l859_c7_ed86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l859_c7_ed86] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;

     -- Submodule level 2
     VAR_BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l866_c8_8c72_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l866_c8_8c72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l872_c7_671a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l872_c7_671a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse := VAR_t8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l864_c7_bf42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l851_c2_1a95] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l859_c7_ed86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l870_c21_2952] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_left;
     BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_return_output := BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l859_c7_ed86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;

     -- n8_MUX[uxn_opcodes_h_l864_c7_bf42] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l864_c7_bf42_cond <= VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_cond;
     n8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue;
     n8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output := n8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c2_1a95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;

     -- t8_MUX[uxn_opcodes_h_l859_c7_ed86] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l859_c7_ed86_cond <= VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_cond;
     t8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue;
     t8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output := t8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l864_c7_bf42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l870_c21_2952_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse := VAR_n8_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse := VAR_t8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;
     -- n8_MUX[uxn_opcodes_h_l859_c7_ed86] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l859_c7_ed86_cond <= VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_cond;
     n8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue;
     n8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output := n8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c2_1a95] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l864_c7_bf42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_return_output := result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c2_1a95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l859_c7_ed86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;

     -- t8_MUX[uxn_opcodes_h_l851_c2_1a95] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l851_c2_1a95_cond <= VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_cond;
     t8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue;
     t8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output := t8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l859_c7_ed86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse := VAR_n8_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l864_c7_bf42_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l851_c2_1a95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l859_c7_ed86] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_cond;
     result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_return_output := result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l851_c2_1a95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;

     -- n8_MUX[uxn_opcodes_h_l851_c2_1a95] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l851_c2_1a95_cond <= VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_cond;
     n8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue;
     n8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output := n8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l859_c7_ed86_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l851_c2_1a95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_return_output := result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l877_l847_DUPLICATE_9b8d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l877_l847_DUPLICATE_9b8d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c2_1a95_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c2_1a95_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l877_l847_DUPLICATE_9b8d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l877_l847_DUPLICATE_9b8d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
