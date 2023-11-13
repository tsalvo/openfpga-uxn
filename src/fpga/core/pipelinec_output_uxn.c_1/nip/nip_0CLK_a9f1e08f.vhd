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
-- Submodules: 32
entity nip_0CLK_a9f1e08f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip_0CLK_a9f1e08f;
architecture arch of nip_0CLK_a9f1e08f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2032_c6_9220]
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_adf1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2032_c2_82d9]
signal t8_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c2_82d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2032_c2_82d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2032_c2_82d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c2_82d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2032_c2_82d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2032_c2_82d9]
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2033_c3_a279[uxn_opcodes_h_l2033_c3_a279]
signal printf_uxn_opcodes_h_l2033_c3_a279_uxn_opcodes_h_l2033_c3_a279_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_c0a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2037_c7_83c0]
signal t8_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_83c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2037_c7_83c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_83c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_83c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_83c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2037_c7_83c0]
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_b219]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2040_c7_0daf]
signal t8_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_0daf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c7_0daf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_0daf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_0daf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_0daf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2040_c7_0daf]
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2043_c30_c25b]
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_d48e]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_457f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_457f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_457f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_left,
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_right,
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_return_output);

-- t8_MUX_uxn_opcodes_h_l2032_c2_82d9
t8_MUX_uxn_opcodes_h_l2032_c2_82d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2032_c2_82d9_cond,
t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue,
t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse,
t8_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output);

-- printf_uxn_opcodes_h_l2033_c3_a279_uxn_opcodes_h_l2033_c3_a279
printf_uxn_opcodes_h_l2033_c3_a279_uxn_opcodes_h_l2033_c3_a279 : entity work.printf_uxn_opcodes_h_l2033_c3_a279_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2033_c3_a279_uxn_opcodes_h_l2033_c3_a279_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output);

-- t8_MUX_uxn_opcodes_h_l2037_c7_83c0
t8_MUX_uxn_opcodes_h_l2037_c7_83c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2037_c7_83c0_cond,
t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue,
t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse,
t8_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output);

-- t8_MUX_uxn_opcodes_h_l2040_c7_0daf
t8_MUX_uxn_opcodes_h_l2040_c7_0daf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2040_c7_0daf_cond,
t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue,
t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse,
t8_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b
sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_ins,
sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_x,
sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_y,
sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_return_output,
 t8_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output,
 t8_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output,
 t8_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output,
 sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_fbd7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2033_c3_a279_uxn_opcodes_h_l2033_c3_a279_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_6c8f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_b604 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2040_c7_0daf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_3ad3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_4a2f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_a8fc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_32ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_5314_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2054_l2028_DUPLICATE_28ae_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_b604 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_b604;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_6c8f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_6c8f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_fbd7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_fbd7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2032_c6_9220] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_left;
     BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output := BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_b219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_3ad3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_3ad3_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_d48e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2043_c30_c25b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_ins;
     sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_x;
     sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_return_output := sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_5314 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_5314_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2040_c7_0daf] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2040_c7_0daf_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_a8fc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_a8fc_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_4a2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_4a2f_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_32ba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_32ba_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_c0a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_9220_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_c0a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_b219_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_d48e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_a8fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_a8fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_a8fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_5314_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_5314_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_5314_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_3ad3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_3ad3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_3ad3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_4a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_4a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_4a2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_32ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_32ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2032_l2037_l2040_DUPLICATE_32ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2040_c7_0daf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_c25b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_adf1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2040_c7_0daf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_457f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_0daf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_457f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2040_c7_0daf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2040_c7_0daf_cond <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_cond;
     t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue;
     t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output := t8_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_0daf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_457f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2033_c3_a279_uxn_opcodes_h_l2033_c3_a279_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_adf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_457f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_457f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_457f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_83c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c7_0daf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_0daf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;

     -- t8_MUX[uxn_opcodes_h_l2037_c7_83c0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2037_c7_83c0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_cond;
     t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue;
     t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output := t8_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_83c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;

     -- printf_uxn_opcodes_h_l2033_c3_a279[uxn_opcodes_h_l2033_c3_a279] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2033_c3_a279_uxn_opcodes_h_l2033_c3_a279_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2033_c3_a279_uxn_opcodes_h_l2033_c3_a279_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l2037_c7_83c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_0daf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0daf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_83c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2032_c2_82d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2032_c2_82d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output;

     -- t8_MUX[uxn_opcodes_h_l2032_c2_82d9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2032_c2_82d9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_cond;
     t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue;
     t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output := t8_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_83c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2037_c7_83c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2032_c2_82d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_83c0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2032_c2_82d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c2_82d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c2_82d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2054_l2028_DUPLICATE_28ae LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2054_l2028_DUPLICATE_28ae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_82d9_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2054_l2028_DUPLICATE_28ae_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2054_l2028_DUPLICATE_28ae_return_output;
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
