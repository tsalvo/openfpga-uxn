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
-- Submodules: 38
entity gth_0CLK_0d289325 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end gth_0CLK_0d289325;
architecture arch of gth_0CLK_0d289325 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1655_c6_0164]
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c2_5a07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1655_c2_5a07]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1655_c2_5a07]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c2_5a07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1655_c2_5a07]
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c2_5a07]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c2_5a07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1655_c2_5a07]
signal t8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1655_c2_5a07]
signal n8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_cc96]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_1b2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_1b2a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1663_c7_1b2a]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_1b2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_1b2a]
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1663_c7_1b2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_1b2a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1663_c7_1b2a]
signal t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1663_c7_1b2a]
signal n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1666_c30_08d2]
signal sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_504e]
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1668_c7_5d81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_5d81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_5d81]
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1668_c7_5d81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_5d81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1668_c7_5d81]
signal t8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1668_c7_5d81]
signal n8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1670_c18_867b]
signal CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_return_output : unsigned(15 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1674_c21_62f3]
signal BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1674_c21_6a30]
signal MUX_uxn_opcodes_h_l1674_c21_6a30_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1674_c21_6a30_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1674_c21_6a30_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1674_c21_6a30_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1676_c11_a121]
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c7_84c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1676_c7_84c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_left,
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_right,
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07
result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_cond,
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output);

-- t8_MUX_uxn_opcodes_h_l1655_c2_5a07
t8_MUX_uxn_opcodes_h_l1655_c2_5a07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond,
t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue,
t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse,
t8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output);

-- n8_MUX_uxn_opcodes_h_l1655_c2_5a07
n8_MUX_uxn_opcodes_h_l1655_c2_5a07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond,
n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue,
n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse,
n8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output);

-- t8_MUX_uxn_opcodes_h_l1663_c7_1b2a
t8_MUX_uxn_opcodes_h_l1663_c7_1b2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond,
t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue,
t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse,
t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output);

-- n8_MUX_uxn_opcodes_h_l1663_c7_1b2a
n8_MUX_uxn_opcodes_h_l1663_c7_1b2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond,
n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue,
n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse,
n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2
sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_ins,
sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_x,
sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_y,
sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_left,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_right,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81
result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_cond,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output);

-- t8_MUX_uxn_opcodes_h_l1668_c7_5d81
t8_MUX_uxn_opcodes_h_l1668_c7_5d81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond,
t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue,
t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse,
t8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output);

-- n8_MUX_uxn_opcodes_h_l1668_c7_5d81
n8_MUX_uxn_opcodes_h_l1668_c7_5d81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond,
n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue,
n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse,
n8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1670_c18_867b
CONST_SR_8_uxn_opcodes_h_l1670_c18_867b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_x,
CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3
BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_left,
BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_right,
BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_return_output);

-- MUX_uxn_opcodes_h_l1674_c21_6a30
MUX_uxn_opcodes_h_l1674_c21_6a30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1674_c21_6a30_cond,
MUX_uxn_opcodes_h_l1674_c21_6a30_iftrue,
MUX_uxn_opcodes_h_l1674_c21_6a30_iffalse,
MUX_uxn_opcodes_h_l1674_c21_6a30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_left,
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_right,
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
 t8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
 n8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output,
 t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output,
 n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output,
 t8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output,
 n8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output,
 CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_return_output,
 MUX_uxn_opcodes_h_l1674_c21_6a30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1660_c3_a71d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1663_c7_1b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_1a4b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1669_c8_9b59_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1670_c8_5de9_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1655_DUPLICATE_c52c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1668_l1655_DUPLICATE_7d3f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1655_DUPLICATE_e0f9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1663_l1655_l1676_DUPLICATE_c122_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1663_l1668_DUPLICATE_66d8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1668_l1676_DUPLICATE_18b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1681_l1651_DUPLICATE_8ccf_return_output : opcode_result_t;
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
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1660_c3_a71d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1660_c3_a71d;
     VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_1a4b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_1a4b;
     VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1655_DUPLICATE_e0f9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1655_DUPLICATE_e0f9_return_output := result.sp_relative_shift;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l1663_c7_1b2a] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1663_c7_1b2a_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1668_l1676_DUPLICATE_18b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1668_l1676_DUPLICATE_18b2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_504e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1669_c8_9b59] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1669_c8_9b59_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1663_l1668_DUPLICATE_66d8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1663_l1668_DUPLICATE_66d8_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1668_l1655_DUPLICATE_7d3f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1668_l1655_DUPLICATE_7d3f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_cc96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1663_l1655_l1676_DUPLICATE_c122 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1663_l1655_l1676_DUPLICATE_c122_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1666_c30_08d2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_ins;
     sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_x;
     sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_return_output := sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1676_c11_a121] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_left;
     BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_return_output := BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1655_c6_0164] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_left;
     BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output := BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1655_DUPLICATE_c52c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1655_DUPLICATE_c52c_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1670_c18_867b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_return_output := CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_0164_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cc96_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_504e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_a121_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_right := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1669_c8_9b59_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1669_c8_9b59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1655_DUPLICATE_e0f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1655_DUPLICATE_e0f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1668_l1676_DUPLICATE_18b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1668_l1676_DUPLICATE_18b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1668_l1676_DUPLICATE_18b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1655_DUPLICATE_c52c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1655_DUPLICATE_c52c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1663_l1655_l1676_DUPLICATE_c122_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1663_l1655_l1676_DUPLICATE_c122_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1663_l1655_l1676_DUPLICATE_c122_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1663_l1668_DUPLICATE_66d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1663_l1668_DUPLICATE_66d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1668_l1655_DUPLICATE_7d3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1668_l1655_DUPLICATE_7d3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1663_l1668_l1655_DUPLICATE_7d3f_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1663_c7_1b2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1666_c30_08d2_return_output;
     -- t8_MUX[uxn_opcodes_h_l1668_c7_5d81] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond <= VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond;
     t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue;
     t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output := t8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_5d81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1663_c7_1b2a] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1668_c7_5d81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1670_c8_5de9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1670_c8_5de9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1670_c18_867b_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1676_c7_84c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1663_c7_1b2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c7_84c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1670_c8_5de9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1670_c8_5de9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_84c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1674_c21_62f3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_left;
     BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_return_output := BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_1b2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1668_c7_5d81] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond <= VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_cond;
     n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue;
     n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output := n8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1655_c2_5a07] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;

     -- t8_MUX[uxn_opcodes_h_l1663_c7_1b2a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond;
     t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue;
     t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output := t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_1b2a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_5d81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1668_c7_5d81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c2_5a07] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1674_c21_62f3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;
     -- t8_MUX[uxn_opcodes_h_l1655_c2_5a07] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond <= VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond;
     t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue;
     t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output := t8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_1b2a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1663_c7_1b2a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond;
     n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue;
     n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output := n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_1b2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c2_5a07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;

     -- MUX[uxn_opcodes_h_l1674_c21_6a30] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1674_c21_6a30_cond <= VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_cond;
     MUX_uxn_opcodes_h_l1674_c21_6a30_iftrue <= VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_iftrue;
     MUX_uxn_opcodes_h_l1674_c21_6a30_iffalse <= VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_return_output := MUX_uxn_opcodes_h_l1674_c21_6a30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1655_c2_5a07] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue := VAR_MUX_uxn_opcodes_h_l1674_c21_6a30_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c2_5a07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c2_5a07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;

     -- n8_MUX[uxn_opcodes_h_l1655_c2_5a07] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond <= VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_cond;
     n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue;
     n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output := n8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_5d81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output := result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5d81_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_1b2a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_1b2a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1655_c2_5a07] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output := result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1681_l1651_DUPLICATE_8ccf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1681_l1651_DUPLICATE_8ccf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_5a07_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1681_l1651_DUPLICATE_8ccf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9d9a_uxn_opcodes_h_l1681_l1651_DUPLICATE_8ccf_return_output;
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
