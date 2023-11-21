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
entity add_0CLK_7883ef49 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_7883ef49;
architecture arch of add_0CLK_7883ef49 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l781_c6_9c25]
signal BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l781_c2_eaac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l781_c2_eaac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l781_c2_eaac]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l781_c2_eaac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l781_c2_eaac]
signal result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l781_c2_eaac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l781_c2_eaac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l781_c2_eaac]
signal t8_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l781_c2_eaac]
signal n8_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l789_c11_4d01]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_681e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c7_681e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l789_c7_681e]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_681e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l789_c7_681e]
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_681e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_681e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l789_c7_681e]
signal t8_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l789_c7_681e]
signal n8_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l792_c30_13f9]
signal sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_abe9]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l794_c7_95d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_95d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l794_c7_95d8]
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_95d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_95d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l794_c7_95d8]
signal t8_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l794_c7_95d8]
signal n8_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l796_c18_a507]
signal CONST_SR_8_uxn_opcodes_h_l796_c18_a507_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l796_c18_a507_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l800_c21_6b33]
signal BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l802_c11_24a9]
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_14d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l802_c7_14d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25
BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_left,
BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_right,
BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac
result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac
result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac
result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_cond,
result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac
result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac
result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_return_output);

-- t8_MUX_uxn_opcodes_h_l781_c2_eaac
t8_MUX_uxn_opcodes_h_l781_c2_eaac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l781_c2_eaac_cond,
t8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue,
t8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse,
t8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output);

-- n8_MUX_uxn_opcodes_h_l781_c2_eaac
n8_MUX_uxn_opcodes_h_l781_c2_eaac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l781_c2_eaac_cond,
n8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue,
n8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse,
n8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01
BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e
result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_cond,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_return_output);

-- t8_MUX_uxn_opcodes_h_l789_c7_681e
t8_MUX_uxn_opcodes_h_l789_c7_681e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l789_c7_681e_cond,
t8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue,
t8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse,
t8_MUX_uxn_opcodes_h_l789_c7_681e_return_output);

-- n8_MUX_uxn_opcodes_h_l789_c7_681e
n8_MUX_uxn_opcodes_h_l789_c7_681e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l789_c7_681e_cond,
n8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue,
n8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse,
n8_MUX_uxn_opcodes_h_l789_c7_681e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l792_c30_13f9
sp_relative_shift_uxn_opcodes_h_l792_c30_13f9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_ins,
sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_x,
sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_y,
sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9
BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8
result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_return_output);

-- t8_MUX_uxn_opcodes_h_l794_c7_95d8
t8_MUX_uxn_opcodes_h_l794_c7_95d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l794_c7_95d8_cond,
t8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue,
t8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse,
t8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output);

-- n8_MUX_uxn_opcodes_h_l794_c7_95d8
n8_MUX_uxn_opcodes_h_l794_c7_95d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l794_c7_95d8_cond,
n8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue,
n8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse,
n8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l796_c18_a507
CONST_SR_8_uxn_opcodes_h_l796_c18_a507 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l796_c18_a507_x,
CONST_SR_8_uxn_opcodes_h_l796_c18_a507_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33
BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_left,
BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_right,
BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9
BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_left,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_right,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1
result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
 t8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
 n8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_return_output,
 t8_MUX_uxn_opcodes_h_l789_c7_681e_return_output,
 n8_MUX_uxn_opcodes_h_l789_c7_681e_return_output,
 sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_return_output,
 t8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output,
 n8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output,
 CONST_SR_8_uxn_opcodes_h_l796_c18_a507_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_ebdf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l789_c7_681e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l800_c3_dbda : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_0f82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l795_c8_8e19_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l796_c18_a507_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l796_c18_a507_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l796_c8_ba43_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l781_DUPLICATE_18e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l794_l781_l789_DUPLICATE_d5fc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l781_l789_DUPLICATE_8370_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l781_l802_l789_DUPLICATE_c2d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l789_DUPLICATE_2298_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l802_l789_DUPLICATE_2edc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l777_l807_DUPLICATE_e510_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_ebdf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_ebdf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_0f82 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_0f82;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l796_c18_a507_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l794_l781_l789_DUPLICATE_d5fc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l794_l781_l789_DUPLICATE_d5fc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_abe9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l802_l789_DUPLICATE_2edc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l802_l789_DUPLICATE_2edc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c11_4d01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l781_c6_9c25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_left;
     BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output := BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l781_DUPLICATE_18e4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l781_DUPLICATE_18e4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l781_l802_l789_DUPLICATE_c2d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l781_l802_l789_DUPLICATE_c2d9_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l789_DUPLICATE_2298 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l789_DUPLICATE_2298_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l796_c18_a507] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l796_c18_a507_x <= VAR_CONST_SR_8_uxn_opcodes_h_l796_c18_a507_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l796_c18_a507_return_output := CONST_SR_8_uxn_opcodes_h_l796_c18_a507_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l792_c30_13f9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_ins;
     sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_x;
     sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_return_output := sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l781_l789_DUPLICATE_8370 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l781_l789_DUPLICATE_8370_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l795_c8_8e19] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l795_c8_8e19_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l789_c7_681e] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l789_c7_681e_return_output := result.is_stack_operation_16bit;

     -- BIN_OP_EQ[uxn_opcodes_h_l802_c11_24a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l781_c6_9c25_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_4d01_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_abe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_24a9_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_right := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l795_c8_8e19_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l795_c8_8e19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l781_l789_DUPLICATE_8370_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l781_l789_DUPLICATE_8370_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l802_l789_DUPLICATE_2edc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l802_l789_DUPLICATE_2edc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l802_l789_DUPLICATE_2edc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l781_DUPLICATE_18e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l794_l781_DUPLICATE_18e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l781_l802_l789_DUPLICATE_c2d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l781_l802_l789_DUPLICATE_c2d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l781_l802_l789_DUPLICATE_c2d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l789_DUPLICATE_2298_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l789_DUPLICATE_2298_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l794_l781_l789_DUPLICATE_d5fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l794_l781_l789_DUPLICATE_d5fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l794_l781_l789_DUPLICATE_d5fc_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l789_c7_681e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_13f9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l794_c7_95d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_681e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output;

     -- t8_MUX[uxn_opcodes_h_l794_c7_95d8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l794_c7_95d8_cond <= VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_cond;
     t8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue;
     t8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output := t8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l796_c8_ba43] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l796_c8_ba43_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l796_c18_a507_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l802_c7_14d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l789_c7_681e] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_95d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_14d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l796_c8_ba43_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l796_c8_ba43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_14d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l789_c7_681e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_14d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;
     -- t8_MUX[uxn_opcodes_h_l789_c7_681e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l789_c7_681e_cond <= VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_cond;
     t8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue;
     t8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_return_output := t8_MUX_uxn_opcodes_h_l789_c7_681e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l800_c21_6b33] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_left;
     BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_return_output := BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l781_c2_eaac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;

     -- n8_MUX[uxn_opcodes_h_l794_c7_95d8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l794_c7_95d8_cond <= VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_cond;
     n8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue;
     n8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output := n8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c7_681e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_95d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_681e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l781_c2_eaac] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_95d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;

     -- Submodule level 3
     VAR_result_u8_value_uxn_opcodes_h_l800_c3_dbda := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l800_c21_6b33_return_output, 8);
     VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c7_681e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_681e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse := VAR_t8_MUX_uxn_opcodes_h_l789_c7_681e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue := VAR_result_u8_value_uxn_opcodes_h_l800_c3_dbda;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_681e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_return_output;

     -- n8_MUX[uxn_opcodes_h_l789_c7_681e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l789_c7_681e_cond <= VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_cond;
     n8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_iftrue;
     n8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_return_output := n8_MUX_uxn_opcodes_h_l789_c7_681e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l781_c2_eaac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l781_c2_eaac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_681e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l794_c7_95d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;

     -- t8_MUX[uxn_opcodes_h_l781_c2_eaac] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l781_c2_eaac_cond <= VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_cond;
     t8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue;
     t8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output := t8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse := VAR_n8_MUX_uxn_opcodes_h_l789_c7_681e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_681e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_681e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_95d8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l789_c7_681e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_return_output := result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l781_c2_eaac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l781_c2_eaac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;

     -- n8_MUX[uxn_opcodes_h_l781_c2_eaac] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l781_c2_eaac_cond <= VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_cond;
     n8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue;
     n8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output := n8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_681e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l781_c2_eaac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_return_output := result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l777_l807_DUPLICATE_e510 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l777_l807_DUPLICATE_e510_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l781_c2_eaac_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l781_c2_eaac_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l777_l807_DUPLICATE_e510_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l777_l807_DUPLICATE_e510_return_output;
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
