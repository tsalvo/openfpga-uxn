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
entity jmp2_0CLK_b6f89731 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_b6f89731;
architecture arch of jmp2_0CLK_b6f89731 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l601_c6_fa61]
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l601_c2_b0f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l601_c2_b0f8]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l601_c2_b0f8]
signal result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l601_c2_b0f8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l601_c2_b0f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l601_c2_b0f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l601_c2_b0f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l601_c2_b0f8]
signal t16_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l609_c11_04e0]
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l609_c7_4437]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l609_c7_4437]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l609_c7_4437]
signal result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l609_c7_4437]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l609_c7_4437]
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l609_c7_4437]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l609_c7_4437]
signal t16_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l611_c30_b5e3]
signal sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l614_c11_8b0f]
signal BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l614_c7_6a27]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l614_c7_6a27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l614_c7_6a27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l614_c7_6a27]
signal result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l614_c7_6a27]
signal t16_MUX_uxn_opcodes_h_l614_c7_6a27_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l614_c7_6a27_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l620_c11_ba31]
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l620_c7_5997]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l620_c7_5997]
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_ce21( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.is_stack_operation_16bit := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61
BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_left,
BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_right,
BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8
result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_cond,
result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output);

-- t16_MUX_uxn_opcodes_h_l601_c2_b0f8
t16_MUX_uxn_opcodes_h_l601_c2_b0f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l601_c2_b0f8_cond,
t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue,
t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse,
t16_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0
BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_left,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_right,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437
result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_cond,
result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output);

-- t16_MUX_uxn_opcodes_h_l609_c7_4437
t16_MUX_uxn_opcodes_h_l609_c7_4437 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l609_c7_4437_cond,
t16_MUX_uxn_opcodes_h_l609_c7_4437_iftrue,
t16_MUX_uxn_opcodes_h_l609_c7_4437_iffalse,
t16_MUX_uxn_opcodes_h_l609_c7_4437_return_output);

-- sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3
sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_ins,
sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_x,
sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_y,
sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f
BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_left,
BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_right,
BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27
result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27
result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27
result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_cond,
result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_return_output);

-- t16_MUX_uxn_opcodes_h_l614_c7_6a27
t16_MUX_uxn_opcodes_h_l614_c7_6a27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l614_c7_6a27_cond,
t16_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue,
t16_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse,
t16_MUX_uxn_opcodes_h_l614_c7_6a27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31
BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_left,
BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_right,
BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
 t16_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output,
 t16_MUX_uxn_opcodes_h_l609_c7_4437_return_output,
 sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_return_output,
 t16_MUX_uxn_opcodes_h_l614_c7_6a27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l606_c3_f3c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l609_c7_4437_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l614_l601_DUPLICATE_6196_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l614_l601_l609_DUPLICATE_22b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l601_l620_l609_DUPLICATE_178c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l601_l609_DUPLICATE_71ec_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l614_l620_l609_DUPLICATE_ad45_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l597_l625_DUPLICATE_f32d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_right := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l606_c3_f3c7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l606_c3_f3c7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_left := VAR_phase;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue := VAR_previous_stack_read;
     VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue := VAR_previous_stack_read;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l601_l609_DUPLICATE_71ec LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l601_l609_DUPLICATE_71ec_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l601_c6_fa61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_left;
     BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output := BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l614_c11_8b0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l614_l620_l609_DUPLICATE_ad45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l614_l620_l609_DUPLICATE_ad45_return_output := result.is_opc_done;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l609_c7_4437] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l609_c7_4437_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l614_l601_l609_DUPLICATE_22b5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l614_l601_l609_DUPLICATE_22b5_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l609_c11_04e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l601_l620_l609_DUPLICATE_178c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l601_l620_l609_DUPLICATE_178c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l614_l601_DUPLICATE_6196 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l614_l601_DUPLICATE_6196_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l620_c11_ba31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_left;
     BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_return_output := BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l601_c2_b0f8] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l601_c2_b0f8_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l611_c30_b5e3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_ins;
     sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_x;
     sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_return_output := sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_fa61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_04e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l614_c11_8b0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_ba31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l601_l609_DUPLICATE_71ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l601_l609_DUPLICATE_71ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l614_l601_l609_DUPLICATE_22b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l614_l601_l609_DUPLICATE_22b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l614_l601_l609_DUPLICATE_22b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l614_l620_l609_DUPLICATE_ad45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l614_l620_l609_DUPLICATE_ad45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l614_l620_l609_DUPLICATE_ad45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l601_l620_l609_DUPLICATE_178c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l601_l620_l609_DUPLICATE_178c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l601_l620_l609_DUPLICATE_178c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l614_l601_DUPLICATE_6196_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l614_l601_DUPLICATE_6196_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l609_c7_4437_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l601_c2_b0f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l611_c30_b5e3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l614_c7_6a27] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_cond;
     result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_return_output := result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l601_c2_b0f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l609_c7_4437] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l614_c7_6a27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l609_c7_4437] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l620_c7_5997] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l620_c7_5997] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_return_output;

     -- t16_MUX[uxn_opcodes_h_l614_c7_6a27] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l614_c7_6a27_cond <= VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_cond;
     t16_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue;
     t16_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_return_output := t16_MUX_uxn_opcodes_h_l614_c7_6a27_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_5997_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_5997_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l614_c7_6a27_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l609_c7_4437_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l614_c7_6a27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_iffalse := VAR_t16_MUX_uxn_opcodes_h_l614_c7_6a27_return_output;
     -- t16_MUX[uxn_opcodes_h_l609_c7_4437] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l609_c7_4437_cond <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_cond;
     t16_MUX_uxn_opcodes_h_l609_c7_4437_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_iftrue;
     t16_MUX_uxn_opcodes_h_l609_c7_4437_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_return_output := t16_MUX_uxn_opcodes_h_l609_c7_4437_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l601_c2_b0f8] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l614_c7_6a27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l601_c2_b0f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l609_c7_4437] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l614_c7_6a27] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l609_c7_4437] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_cond;
     result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_return_output := result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l614_c7_6a27_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l614_c7_6a27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_4437_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l609_c7_4437_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l609_c7_4437_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l601_c2_b0f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l609_c7_4437] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_return_output;

     -- t16_MUX[uxn_opcodes_h_l601_c2_b0f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l601_c2_b0f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_cond;
     t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue;
     t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output := t16_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l609_c7_4437] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l601_c2_b0f8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output := result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_4437_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_4437_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l601_c2_b0f8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l601_c2_b0f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l597_l625_DUPLICATE_f32d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l597_l625_DUPLICATE_f32d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ce21(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_b0f8_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l597_l625_DUPLICATE_f32d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l597_l625_DUPLICATE_f32d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
