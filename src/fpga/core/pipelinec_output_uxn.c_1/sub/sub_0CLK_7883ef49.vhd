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
entity sub_0CLK_7883ef49 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end sub_0CLK_7883ef49;
architecture arch of sub_0CLK_7883ef49 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2215_c6_52b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2215_c2_5f72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2215_c2_5f72]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2215_c2_5f72]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2215_c2_5f72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2215_c2_5f72]
signal result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2215_c2_5f72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2215_c2_5f72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2215_c2_5f72]
signal t8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2215_c2_5f72]
signal n8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2223_c11_8a08]
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2223_c7_fbda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2223_c7_fbda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2223_c7_fbda]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2223_c7_fbda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2223_c7_fbda]
signal result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2223_c7_fbda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2223_c7_fbda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2223_c7_fbda]
signal t8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2223_c7_fbda]
signal n8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2226_c30_2514]
signal sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2228_c11_35eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2228_c7_9174]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2228_c7_9174]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2228_c7_9174]
signal result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2228_c7_9174]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2228_c7_9174]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2228_c7_9174]
signal t8_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2228_c7_9174]
signal n8_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2230_c18_c10c]
signal CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2234_c21_c778]
signal BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2236_c11_5fa6]
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2236_c7_cb79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2236_c7_cb79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9
BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72
result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_cond,
result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output);

-- t8_MUX_uxn_opcodes_h_l2215_c2_5f72
t8_MUX_uxn_opcodes_h_l2215_c2_5f72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond,
t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue,
t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse,
t8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output);

-- n8_MUX_uxn_opcodes_h_l2215_c2_5f72
n8_MUX_uxn_opcodes_h_l2215_c2_5f72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond,
n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue,
n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse,
n8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_left,
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_right,
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda
result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_cond,
result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output);

-- t8_MUX_uxn_opcodes_h_l2223_c7_fbda
t8_MUX_uxn_opcodes_h_l2223_c7_fbda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond,
t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue,
t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse,
t8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output);

-- n8_MUX_uxn_opcodes_h_l2223_c7_fbda
n8_MUX_uxn_opcodes_h_l2223_c7_fbda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond,
n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue,
n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse,
n8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2226_c30_2514
sp_relative_shift_uxn_opcodes_h_l2226_c30_2514 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_ins,
sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_x,
sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_y,
sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb
BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174
result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174
result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174
result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_cond,
result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174
result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_return_output);

-- t8_MUX_uxn_opcodes_h_l2228_c7_9174
t8_MUX_uxn_opcodes_h_l2228_c7_9174 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2228_c7_9174_cond,
t8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue,
t8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse,
t8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output);

-- n8_MUX_uxn_opcodes_h_l2228_c7_9174
n8_MUX_uxn_opcodes_h_l2228_c7_9174 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2228_c7_9174_cond,
n8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue,
n8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse,
n8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c
CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_x,
CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778
BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_left,
BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_right,
BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6
BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_left,
BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_right,
BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
 t8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
 n8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output,
 t8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output,
 n8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output,
 sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_return_output,
 t8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output,
 n8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output,
 CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_1681 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2223_c7_fbda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2233_c3_d46e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2229_c8_b8e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2230_c8_84b5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2228_l2215_DUPLICATE_29c4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2223_l2228_l2215_DUPLICATE_a170_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2223_l2215_DUPLICATE_817f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2223_l2215_l2236_DUPLICATE_4694_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2223_l2228_DUPLICATE_0dc2_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2223_l2228_l2236_DUPLICATE_024b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l2241_l2211_DUPLICATE_ce76_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_1681 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_1681;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2233_c3_d46e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2233_c3_d46e;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2223_c11_8a08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_left;
     BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output := BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2230_c18_c10c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_return_output := CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2223_l2228_l2236_DUPLICATE_024b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2223_l2228_l2236_DUPLICATE_024b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2223_l2228_DUPLICATE_0dc2 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2223_l2228_DUPLICATE_0dc2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2223_l2215_l2236_DUPLICATE_4694 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2223_l2215_l2236_DUPLICATE_4694_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2228_l2215_DUPLICATE_29c4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2228_l2215_DUPLICATE_29c4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2223_l2215_DUPLICATE_817f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2223_l2215_DUPLICATE_817f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2223_l2228_l2215_DUPLICATE_a170 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2223_l2228_l2215_DUPLICATE_a170_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2215_c6_52b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2226_c30_2514] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_ins;
     sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_x;
     sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_return_output := sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2228_c11_35eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2229_c8_b8e3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2229_c8_b8e3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2236_c11_5fa6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_return_output;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l2223_c7_fbda] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2223_c7_fbda_return_output := result.is_stack_operation_16bit;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2215_c6_52b9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_8a08_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2228_c11_35eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c11_5fa6_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_right := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2229_c8_b8e3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2229_c8_b8e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2223_l2215_DUPLICATE_817f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2223_l2215_DUPLICATE_817f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2223_l2228_l2236_DUPLICATE_024b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2223_l2228_l2236_DUPLICATE_024b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2223_l2228_l2236_DUPLICATE_024b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2228_l2215_DUPLICATE_29c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2228_l2215_DUPLICATE_29c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2223_l2215_l2236_DUPLICATE_4694_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2223_l2215_l2236_DUPLICATE_4694_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2223_l2215_l2236_DUPLICATE_4694_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2223_l2228_DUPLICATE_0dc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2223_l2228_DUPLICATE_0dc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2223_l2228_l2215_DUPLICATE_a170_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2223_l2228_l2215_DUPLICATE_a170_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2223_l2228_l2215_DUPLICATE_a170_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2223_c7_fbda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2226_c30_2514_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2236_c7_cb79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2223_c7_fbda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2228_c7_9174] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2230_c8_84b5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2230_c8_84b5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2230_c18_c10c_return_output);

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2223_c7_fbda] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;

     -- t8_MUX[uxn_opcodes_h_l2228_c7_9174] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2228_c7_9174_cond <= VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_cond;
     t8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue;
     t8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output := t8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2236_c7_cb79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2228_c7_9174] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;

     -- Submodule level 2
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2230_c8_84b5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2230_c8_84b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c7_cb79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;
     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2215_c2_5f72] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2228_c7_9174] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2215_c2_5f72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2223_c7_fbda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2228_c7_9174] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;

     -- t8_MUX[uxn_opcodes_h_l2223_c7_fbda] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond <= VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond;
     t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue;
     t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output := t8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2234_c21_c778] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_return_output;

     -- n8_MUX[uxn_opcodes_h_l2228_c7_9174] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2228_c7_9174_cond <= VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_cond;
     n8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue;
     n8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output := n8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2223_c7_fbda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2234_c21_c778_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;
     -- t8_MUX[uxn_opcodes_h_l2215_c2_5f72] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond <= VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond;
     t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue;
     t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output := t8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2215_c2_5f72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2223_c7_fbda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;

     -- n8_MUX[uxn_opcodes_h_l2223_c7_fbda] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond <= VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_cond;
     n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue;
     n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output := n8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2215_c2_5f72] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2223_c7_fbda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2228_c7_9174] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_return_output := result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2228_c7_9174_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;
     -- n8_MUX[uxn_opcodes_h_l2215_c2_5f72] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond <= VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_cond;
     n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue;
     n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output := n8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2215_c2_5f72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2215_c2_5f72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2223_c7_fbda] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output := result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_fbda_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2215_c2_5f72] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output := result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l2241_l2211_DUPLICATE_ce76 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l2241_l2211_DUPLICATE_ce76_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2215_c2_5f72_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l2241_l2211_DUPLICATE_ce76_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l2241_l2211_DUPLICATE_ce76_return_output;
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
