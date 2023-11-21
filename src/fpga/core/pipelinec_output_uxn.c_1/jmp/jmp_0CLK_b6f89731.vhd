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
-- Submodules: 29
entity jmp_0CLK_b6f89731 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_b6f89731;
architecture arch of jmp_0CLK_b6f89731 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l571_c6_5f64]
signal BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l571_c2_afe6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l571_c2_afe6]
signal result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l571_c2_afe6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l571_c2_afe6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c2_afe6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c2_afe6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l571_c2_afe6]
signal t8_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l578_c11_1e7c]
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_52bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l578_c7_52bd]
signal result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l578_c7_52bd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_52bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_52bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_52bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l578_c7_52bd]
signal t8_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : signed(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l581_c30_e457]
signal sp_relative_shift_uxn_opcodes_h_l581_c30_e457_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l581_c30_e457_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l581_c30_e457_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l581_c30_e457_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l583_c11_ae4c]
signal BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l583_c7_24f0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l583_c7_24f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l583_c7_24f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l583_c7_24f0]
signal result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l583_c7_24f0]
signal t8_MUX_uxn_opcodes_h_l583_c7_24f0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l583_c7_24f0_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l587_c22_ff23]
signal BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l589_c11_63f4]
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l589_c7_5331]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l589_c7_5331]
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64
BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_left,
BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_right,
BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6
result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_cond,
result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6
result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6
result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_return_output);

-- t8_MUX_uxn_opcodes_h_l571_c2_afe6
t8_MUX_uxn_opcodes_h_l571_c2_afe6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l571_c2_afe6_cond,
t8_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue,
t8_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse,
t8_MUX_uxn_opcodes_h_l571_c2_afe6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c
BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_left,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_right,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd
result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_cond,
result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd
result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_return_output);

-- t8_MUX_uxn_opcodes_h_l578_c7_52bd
t8_MUX_uxn_opcodes_h_l578_c7_52bd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l578_c7_52bd_cond,
t8_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue,
t8_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse,
t8_MUX_uxn_opcodes_h_l578_c7_52bd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l581_c30_e457
sp_relative_shift_uxn_opcodes_h_l581_c30_e457 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l581_c30_e457_ins,
sp_relative_shift_uxn_opcodes_h_l581_c30_e457_x,
sp_relative_shift_uxn_opcodes_h_l581_c30_e457_y,
sp_relative_shift_uxn_opcodes_h_l581_c30_e457_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c
BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_left,
BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_right,
BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0
result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0
result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_cond,
result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_return_output);

-- t8_MUX_uxn_opcodes_h_l583_c7_24f0
t8_MUX_uxn_opcodes_h_l583_c7_24f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l583_c7_24f0_cond,
t8_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue,
t8_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse,
t8_MUX_uxn_opcodes_h_l583_c7_24f0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23
BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_left,
BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_right,
BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4
BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_left,
BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_right,
BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
 t8_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_return_output,
 t8_MUX_uxn_opcodes_h_l578_c7_52bd_return_output,
 sp_relative_shift_uxn_opcodes_h_l581_c30_e457_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_return_output,
 t8_MUX_uxn_opcodes_h_l583_c7_24f0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_8bcc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_b459 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l578_c7_52bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l587_c3_8fec : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l584_c8_8048_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l571_DUPLICATE_0ff0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l578_l583_l571_DUPLICATE_5fb5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l571_l589_DUPLICATE_2a2a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_DUPLICATE_2b05_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l583_l589_DUPLICATE_1839_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a_uxn_opcodes_h_l567_l594_DUPLICATE_9100_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_8bcc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_8bcc;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_b459 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_b459;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l571_l589_DUPLICATE_2a2a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l571_l589_DUPLICATE_2a2a_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l578_l583_l571_DUPLICATE_5fb5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l578_l583_l571_DUPLICATE_5fb5_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l583_c11_ae4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l589_c11_63f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l571_DUPLICATE_0ff0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l571_DUPLICATE_0ff0_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l581_c30_e457] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l581_c30_e457_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_ins;
     sp_relative_shift_uxn_opcodes_h_l581_c30_e457_x <= VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_x;
     sp_relative_shift_uxn_opcodes_h_l581_c30_e457_y <= VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_return_output := sp_relative_shift_uxn_opcodes_h_l581_c30_e457_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l578_c7_52bd] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l578_c7_52bd_return_output := result.stack_address_sp_offset;

     -- CAST_TO_int8_t[uxn_opcodes_h_l584_c8_8048] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l584_c8_8048_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_DUPLICATE_2b05 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_DUPLICATE_2b05_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l578_c11_1e7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l571_c6_5f64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_left;
     BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output := BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l583_l589_DUPLICATE_1839 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l583_l589_DUPLICATE_1839_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c6_5f64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_1e7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_ae4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_63f4_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l584_c8_8048_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l584_c8_8048_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_DUPLICATE_2b05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_DUPLICATE_2b05_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l578_l583_l571_DUPLICATE_5fb5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l578_l583_l571_DUPLICATE_5fb5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l578_l583_l571_DUPLICATE_5fb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l583_l589_DUPLICATE_1839_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l583_l589_DUPLICATE_1839_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l583_l589_DUPLICATE_1839_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l571_l589_DUPLICATE_2a2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l571_l589_DUPLICATE_2a2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l578_l571_l589_DUPLICATE_2a2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l571_DUPLICATE_0ff0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l571_DUPLICATE_0ff0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l578_c7_52bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l581_c30_e457_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_52bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l587_c22_ff23] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_left;
     BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_return_output := BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l589_c7_5331] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l589_c7_5331] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_return_output;

     -- t8_MUX[uxn_opcodes_h_l583_c7_24f0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l583_c7_24f0_cond <= VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_cond;
     t8_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue;
     t8_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_return_output := t8_MUX_uxn_opcodes_h_l583_c7_24f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l583_c7_24f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_52bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l587_c3_8fec := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l587_c22_ff23_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_5331_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_5331_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_24f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l583_c7_24f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l587_c3_8fec;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l583_c7_24f0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_52bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c2_afe6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c2_afe6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l583_c7_24f0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_return_output := result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l583_c7_24f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_return_output;

     -- t8_MUX[uxn_opcodes_h_l578_c7_52bd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l578_c7_52bd_cond <= VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_cond;
     t8_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue;
     t8_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_return_output := t8_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_24f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l583_c7_24f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l583_c7_24f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l578_c7_52bd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_return_output := result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_52bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;

     -- t8_MUX[uxn_opcodes_h_l571_c2_afe6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l571_c2_afe6_cond <= VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_cond;
     t8_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue;
     t8_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_return_output := t8_MUX_uxn_opcodes_h_l571_c2_afe6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l578_c7_52bd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l571_c2_afe6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l578_c7_52bd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l571_c2_afe6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l571_c2_afe6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l571_c2_afe6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l571_c2_afe6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_return_output := result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a_uxn_opcodes_h_l567_l594_DUPLICATE_9100 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a_uxn_opcodes_h_l567_l594_DUPLICATE_9100_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c2_afe6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c2_afe6_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a_uxn_opcodes_h_l567_l594_DUPLICATE_9100_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a_uxn_opcodes_h_l567_l594_DUPLICATE_9100_return_output;
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
