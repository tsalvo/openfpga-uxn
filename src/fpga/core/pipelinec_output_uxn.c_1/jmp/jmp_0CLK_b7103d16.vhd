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
-- Submodules: 33
entity jmp_0CLK_b7103d16 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_b7103d16;
architecture arch of jmp_0CLK_b7103d16 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l584_c6_8f50]
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c1_37cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l584_c2_e4e2]
signal t8_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l584_c2_e4e2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c2_e4e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l584_c2_e4e2]
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l584_c2_e4e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c2_e4e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c2_e4e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l585_c3_c20f[uxn_opcodes_h_l585_c3_c20f]
signal printf_uxn_opcodes_h_l585_c3_c20f_uxn_opcodes_h_l585_c3_c20f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l589_c11_0f22]
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l589_c7_eafa]
signal t8_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l589_c7_eafa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l589_c7_eafa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l589_c7_eafa]
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l589_c7_eafa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l589_c7_eafa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l589_c7_eafa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l592_c11_a8c1]
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l592_c7_4dd2]
signal t8_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l592_c7_4dd2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l592_c7_4dd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l592_c7_4dd2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l592_c7_4dd2]
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c7_4dd2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l595_c30_5b00]
signal sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l597_c22_648a]
signal BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l599_c11_d417]
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l599_c7_3ea4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_3ea4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_3ea4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a132( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50
BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_left,
BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_right,
BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_return_output);

-- t8_MUX_uxn_opcodes_h_l584_c2_e4e2
t8_MUX_uxn_opcodes_h_l584_c2_e4e2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l584_c2_e4e2_cond,
t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue,
t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse,
t8_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2
result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_cond,
result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output);

-- printf_uxn_opcodes_h_l585_c3_c20f_uxn_opcodes_h_l585_c3_c20f
printf_uxn_opcodes_h_l585_c3_c20f_uxn_opcodes_h_l585_c3_c20f : entity work.printf_uxn_opcodes_h_l585_c3_c20f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l585_c3_c20f_uxn_opcodes_h_l585_c3_c20f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22
BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_left,
BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_right,
BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output);

-- t8_MUX_uxn_opcodes_h_l589_c7_eafa
t8_MUX_uxn_opcodes_h_l589_c7_eafa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l589_c7_eafa_cond,
t8_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue,
t8_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse,
t8_MUX_uxn_opcodes_h_l589_c7_eafa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa
result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_cond,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1
BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_left,
BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_right,
BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output);

-- t8_MUX_uxn_opcodes_h_l592_c7_4dd2
t8_MUX_uxn_opcodes_h_l592_c7_4dd2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l592_c7_4dd2_cond,
t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue,
t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse,
t8_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2
result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_cond,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l595_c30_5b00
sp_relative_shift_uxn_opcodes_h_l595_c30_5b00 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_ins,
sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_x,
sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_y,
sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_left,
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_right,
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417
BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_left,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_right,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_return_output,
 t8_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output,
 t8_MUX_uxn_opcodes_h_l589_c7_eafa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output,
 t8_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output,
 sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_e9a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l585_c3_c20f_uxn_opcodes_h_l585_c3_c20f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_f130 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l589_c7_eafa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l597_c3_21dd : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_2f7d_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_f4af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_e891_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1ff6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_0b77_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_7f15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l580_l605_DUPLICATE_0a68_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_e9a1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_e9a1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_f130 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_f130;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l584_c6_8f50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_left;
     BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output := BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l592_c11_a8c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l589_c11_0f22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_left;
     BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output := BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l599_c11_d417] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_left;
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_return_output := BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l593_c8_2f7d] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_2f7d_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_e891 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_e891_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_7f15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_7f15_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_0b77 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_0b77_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1ff6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1ff6_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_f4af LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_f4af_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l589_c7_eafa] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l589_c7_eafa_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l595_c30_5b00] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_ins;
     sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_x <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_x;
     sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_y <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_return_output := sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_8f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_0f22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_a8c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_d417_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_2f7d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_2f7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_0b77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_0b77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_0b77_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1ff6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1ff6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l592_l584_l589_DUPLICATE_1ff6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_7f15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_7f15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l599_l589_DUPLICATE_7f15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_f4af_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_f4af_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_f4af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_e891_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_e891_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l599_l589_DUPLICATE_e891_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l589_c7_eafa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_5b00_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c1_37cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c7_4dd2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l597_c22_648a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_return_output;

     -- t8_MUX[uxn_opcodes_h_l592_c7_4dd2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l592_c7_4dd2_cond <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_cond;
     t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue;
     t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output := t8_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_3ea4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l599_c7_3ea4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_3ea4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l589_c7_eafa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l597_c3_21dd := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_648a_return_output)),16);
     VAR_printf_uxn_opcodes_h_l585_c3_c20f_uxn_opcodes_h_l585_c3_c20f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_37cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_3ea4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse := VAR_t8_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue := VAR_result_u16_value_uxn_opcodes_h_l597_c3_21dd;
     -- result_u16_value_MUX[uxn_opcodes_h_l592_c7_4dd2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output := result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;

     -- t8_MUX[uxn_opcodes_h_l589_c7_eafa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l589_c7_eafa_cond <= VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_cond;
     t8_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue;
     t8_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_return_output := t8_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c2_e4e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l592_c7_4dd2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l592_c7_4dd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;

     -- printf_uxn_opcodes_h_l585_c3_c20f[uxn_opcodes_h_l585_c3_c20f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l585_c3_c20f_uxn_opcodes_h_l585_c3_c20f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l585_c3_c20f_uxn_opcodes_h_l585_c3_c20f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l589_c7_eafa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l592_c7_4dd2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_4dd2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l589_c7_eafa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l589_c7_eafa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c2_e4e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l589_c7_eafa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_return_output := result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l589_c7_eafa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;

     -- t8_MUX[uxn_opcodes_h_l584_c2_e4e2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l584_c2_e4e2_cond <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_cond;
     t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue;
     t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output := t8_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_eafa_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l584_c2_e4e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l584_c2_e4e2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c2_e4e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l584_c2_e4e2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output := result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l580_l605_DUPLICATE_0a68 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l580_l605_DUPLICATE_0a68_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a132(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_e4e2_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l580_l605_DUPLICATE_0a68_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l580_l605_DUPLICATE_0a68_return_output;
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
