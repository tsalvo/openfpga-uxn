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
-- Submodules: 39
entity div_0CLK_2426f54f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end div_0CLK_2426f54f;
architecture arch of div_0CLK_2426f54f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1863_c6_68d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c2_750f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c2_750f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1863_c2_750f]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c2_750f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1863_c2_750f]
signal result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c2_750f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1863_c2_750f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1863_c2_750f]
signal t8_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1863_c2_750f]
signal n8_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_44fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1871_c7_2798]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1871_c7_2798]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1871_c7_2798]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_2798]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1871_c7_2798]
signal result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1871_c7_2798]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1871_c7_2798]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1871_c7_2798]
signal t8_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1871_c7_2798]
signal n8_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1874_c30_d55c]
signal sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_5432]
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1876_c7_3d11]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1876_c7_3d11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1876_c7_3d11]
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1876_c7_3d11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1876_c7_3d11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1876_c7_3d11]
signal t8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1876_c7_3d11]
signal n8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1878_c18_237a]
signal CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1882_c21_2dae]
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l1882_c35_cc3b]
signal BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l1882_c21_fbcc]
signal MUX_uxn_opcodes_h_l1882_c21_fbcc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1882_c21_fbcc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1882_c21_fbcc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1882_c21_fbcc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1884_c11_396f]
signal BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1884_c7_174b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1884_c7_174b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8
BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f
result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_return_output);

-- t8_MUX_uxn_opcodes_h_l1863_c2_750f
t8_MUX_uxn_opcodes_h_l1863_c2_750f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1863_c2_750f_cond,
t8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue,
t8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse,
t8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output);

-- n8_MUX_uxn_opcodes_h_l1863_c2_750f
n8_MUX_uxn_opcodes_h_l1863_c2_750f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1863_c2_750f_cond,
n8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue,
n8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse,
n8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798
result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_cond,
result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_return_output);

-- t8_MUX_uxn_opcodes_h_l1871_c7_2798
t8_MUX_uxn_opcodes_h_l1871_c7_2798 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1871_c7_2798_cond,
t8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue,
t8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse,
t8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output);

-- n8_MUX_uxn_opcodes_h_l1871_c7_2798
n8_MUX_uxn_opcodes_h_l1871_c7_2798 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1871_c7_2798_cond,
n8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue,
n8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse,
n8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c
sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_ins,
sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_x,
sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_y,
sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_left,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_right,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_cond,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output);

-- t8_MUX_uxn_opcodes_h_l1876_c7_3d11
t8_MUX_uxn_opcodes_h_l1876_c7_3d11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond,
t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue,
t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse,
t8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output);

-- n8_MUX_uxn_opcodes_h_l1876_c7_3d11
n8_MUX_uxn_opcodes_h_l1876_c7_3d11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond,
n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue,
n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse,
n8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1878_c18_237a
CONST_SR_8_uxn_opcodes_h_l1878_c18_237a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_x,
CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae
BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_left,
BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_right,
BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b
BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_left,
BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_right,
BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_return_output);

-- MUX_uxn_opcodes_h_l1882_c21_fbcc
MUX_uxn_opcodes_h_l1882_c21_fbcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1882_c21_fbcc_cond,
MUX_uxn_opcodes_h_l1882_c21_fbcc_iftrue,
MUX_uxn_opcodes_h_l1882_c21_fbcc_iffalse,
MUX_uxn_opcodes_h_l1882_c21_fbcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_left,
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_right,
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b
result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b
result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
 t8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
 n8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_return_output,
 t8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output,
 n8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output,
 sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output,
 t8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output,
 n8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output,
 CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_return_output,
 MUX_uxn_opcodes_h_l1882_c21_fbcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_a312 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1871_c7_2798_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_5095 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1877_c8_9fe0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1878_c8_f519_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1876_l1863_DUPLICATE_1cc2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1871_l1876_l1863_DUPLICATE_079e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1871_l1863_DUPLICATE_52e2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1871_l1863_l1884_DUPLICATE_8d17_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_l1876_DUPLICATE_1b12_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1876_l1884_DUPLICATE_faeb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1859_l1889_DUPLICATE_e778_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_5095 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_5095;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_a312 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_a312;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1884_c11_396f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_l1876_DUPLICATE_1b12 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_l1876_DUPLICATE_1b12_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1877_c8_9fe0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1877_c8_9fe0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1871_l1876_l1863_DUPLICATE_079e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1871_l1876_l1863_DUPLICATE_079e_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1874_c30_d55c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_ins;
     sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_x;
     sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_return_output := sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_5432] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_left;
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output := BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l1871_c7_2798] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1871_c7_2798_return_output := result.is_stack_operation_16bit;

     -- CONST_SR_8[uxn_opcodes_h_l1878_c18_237a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_return_output := CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1876_l1863_DUPLICATE_1cc2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1876_l1863_DUPLICATE_1cc2_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1871_l1863_l1884_DUPLICATE_8d17 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1871_l1863_l1884_DUPLICATE_8d17_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1871_l1863_DUPLICATE_52e2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1871_l1863_DUPLICATE_52e2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1876_l1884_DUPLICATE_faeb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1876_l1884_DUPLICATE_faeb_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_44fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1863_c6_68d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_68d8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_44fa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_5432_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_396f_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_right := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1877_c8_9fe0_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1877_c8_9fe0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1877_c8_9fe0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1871_l1863_DUPLICATE_52e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1871_l1863_DUPLICATE_52e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1876_l1884_DUPLICATE_faeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1876_l1884_DUPLICATE_faeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1876_l1884_DUPLICATE_faeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1876_l1863_DUPLICATE_1cc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1876_l1863_DUPLICATE_1cc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1871_l1863_l1884_DUPLICATE_8d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1871_l1863_l1884_DUPLICATE_8d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1871_l1863_l1884_DUPLICATE_8d17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_l1876_DUPLICATE_1b12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_l1876_DUPLICATE_1b12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1871_l1876_l1863_DUPLICATE_079e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1871_l1876_l1863_DUPLICATE_079e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1871_l1876_l1863_DUPLICATE_079e_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1871_c7_2798_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1874_c30_d55c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1884_c7_174b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1871_c7_2798] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1876_c7_3d11] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1876_c7_3d11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1884_c7_174b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1871_c7_2798] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1878_c8_f519] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1878_c8_f519_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1878_c18_237a_return_output);

     -- BIN_OP_EQ[uxn_opcodes_h_l1882_c21_2dae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_return_output;

     -- t8_MUX[uxn_opcodes_h_l1876_c7_3d11] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond <= VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond;
     t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue;
     t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output := t8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c21_2dae_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1878_c8_f519_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1878_c8_f519_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_174b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_174b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c2_750f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1863_c2_750f] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1876_c7_3d11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;

     -- t8_MUX[uxn_opcodes_h_l1871_c7_2798] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1871_c7_2798_cond <= VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_cond;
     t8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue;
     t8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output := t8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1871_c7_2798] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1871_c7_2798] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1876_c7_3d11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l1882_c35_cc3b] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_left;
     BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_return_output := BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1876_c7_3d11] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond <= VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_cond;
     n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue;
     n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output := n8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l1882_c35_cc3b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;
     -- n8_MUX[uxn_opcodes_h_l1871_c7_2798] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1871_c7_2798_cond <= VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_cond;
     n8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue;
     n8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output := n8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c2_750f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c2_750f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;

     -- MUX[uxn_opcodes_h_l1882_c21_fbcc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1882_c21_fbcc_cond <= VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_cond;
     MUX_uxn_opcodes_h_l1882_c21_fbcc_iftrue <= VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_iftrue;
     MUX_uxn_opcodes_h_l1882_c21_fbcc_iffalse <= VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_return_output := MUX_uxn_opcodes_h_l1882_c21_fbcc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_2798] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;

     -- t8_MUX[uxn_opcodes_h_l1863_c2_750f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1863_c2_750f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_cond;
     t8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue;
     t8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output := t8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1871_c7_2798] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue := VAR_MUX_uxn_opcodes_h_l1882_c21_fbcc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1876_c7_3d11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output := result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;

     -- n8_MUX[uxn_opcodes_h_l1863_c2_750f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1863_c2_750f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_cond;
     n8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue;
     n8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output := n8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1863_c2_750f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c2_750f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_3d11_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1871_c7_2798] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_return_output := result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_2798_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1863_c2_750f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1859_l1889_DUPLICATE_e778 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1859_l1889_DUPLICATE_e778_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_750f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_750f_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1859_l1889_DUPLICATE_e778_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1859_l1889_DUPLICATE_e778_return_output;
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
