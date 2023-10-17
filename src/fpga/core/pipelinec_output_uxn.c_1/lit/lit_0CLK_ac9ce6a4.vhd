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
-- Submodules: 30
entity lit_0CLK_ac9ce6a4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_ac9ce6a4;
architecture arch of lit_0CLK_ac9ce6a4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l191_c6_a57e]
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l191_c1_9ed9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l191_c2_2b8c]
signal result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l191_c2_2b8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l191_c2_2b8c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l191_c2_2b8c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l191_c2_2b8c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l191_c2_2b8c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l191_c2_2b8c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l191_c2_2b8c]
signal result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l192_c3_3f6b[uxn_opcodes_h_l192_c3_3f6b]
signal printf_uxn_opcodes_h_l192_c3_3f6b_uxn_opcodes_h_l192_c3_3f6b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l198_c11_b7ac]
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l198_c7_b7b2]
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l198_c7_b7b2]
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_b7b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_b7b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l198_c7_b7b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_b7b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_b7b2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l202_c22_829f]
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l204_c11_bdc1]
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l204_c7_2e2b]
signal result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_2e2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l204_c7_2e2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l204_c7_2e2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_2e2b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l210_c11_2b42]
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l210_c7_e422]
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l210_c7_e422]
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.u16_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e
BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_left,
BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_right,
BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c
result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond,
result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c
result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond,
result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output);

-- printf_uxn_opcodes_h_l192_c3_3f6b_uxn_opcodes_h_l192_c3_3f6b
printf_uxn_opcodes_h_l192_c3_3f6b_uxn_opcodes_h_l192_c3_3f6b : entity work.printf_uxn_opcodes_h_l192_c3_3f6b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l192_c3_3f6b_uxn_opcodes_h_l192_c3_3f6b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac
BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_left,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_right,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2
result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2
result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f
BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_left,
BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_right,
BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1
BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_left,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_right,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b
result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42
BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_left,
BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_right,
BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iffalse : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_0e40 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_2b8c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l192_c3_3f6b_uxn_opcodes_h_l192_c3_3f6b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l202_c3_3847 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_b7b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_6c82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5167_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_e00a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_bb1c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_bb15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_bc91_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l215_l187_DUPLICATE_6c4f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_0e40 := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_0e40;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_6c82 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_6c82;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue := VAR_previous_ram_read;
     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l198_c7_b7b2] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_b7b2_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5167 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5167_return_output := result.u8_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l191_c2_2b8c] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_2b8c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l210_c11_2b42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_left;
     BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_return_output := BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_return_output;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l198_c7_b7b2] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_b7b2_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l198_c11_b7ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l202_c22_829f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_bb15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_bb15_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l204_c11_bdc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_bc91 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_bc91_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_bb1c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_bb1c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_e00a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_e00a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l191_c6_a57e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_left;
     BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output := BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_a57e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_b7ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_bdc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_2b42_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l202_c3_3847 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c22_829f_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_bc91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_bc91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l210_l198_l204_DUPLICATE_bc91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_bb1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_bb1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_bb15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_bb15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l210_l198_l191_DUPLICATE_bb15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_e00a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_e00a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_e00a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5167_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5167_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5167_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_b7b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_2b8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l198_c7_b7b2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue := VAR_result_u16_value_uxn_opcodes_h_l202_c3_3847;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l210_c7_e422] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l198_c7_b7b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l191_c2_2b8c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l204_c7_2e2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l191_c1_9ed9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l198_c7_b7b2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output := result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_2e2b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l204_c7_2e2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l210_c7_e422] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l192_c3_3f6b_uxn_opcodes_h_l192_c3_3f6b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_9ed9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_e422_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_e422_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_2e2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l198_c7_b7b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_b7b2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l191_c2_2b8c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output := result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output;

     -- printf_uxn_opcodes_h_l192_c3_3f6b[uxn_opcodes_h_l192_c3_3f6b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l192_c3_3f6b_uxn_opcodes_h_l192_c3_3f6b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l192_c3_3f6b_uxn_opcodes_h_l192_c3_3f6b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l204_c7_2e2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_b7b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l191_c2_2b8c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_2e2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l191_c2_2b8c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l191_c2_2b8c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l191_c2_2b8c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output := result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_b7b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_b7b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_b7b2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l191_c2_2b8c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l191_c2_2b8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l215_l187_DUPLICATE_6c4f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l215_l187_DUPLICATE_6c4f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l191_c2_2b8c_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l215_l187_DUPLICATE_6c4f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l215_l187_DUPLICATE_6c4f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
