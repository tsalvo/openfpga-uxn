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
-- BIN_OP_EQ[uxn_opcodes_h_l2283_c6_56ce]
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2283_c1_db9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c2_e376]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2283_c2_e376]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c2_e376]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2283_c2_e376]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2283_c2_e376]
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c2_e376]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2283_c2_e376]
signal t8_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2284_c3_edda[uxn_opcodes_h_l2284_c3_edda]
signal printf_uxn_opcodes_h_l2284_c3_edda_uxn_opcodes_h_l2284_c3_edda_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2288_c11_2f50]
signal BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2288_c7_6143]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2288_c7_6143]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2288_c7_6143]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2288_c7_6143]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2288_c7_6143]
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2288_c7_6143]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2288_c7_6143]
signal t8_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2291_c11_7037]
signal BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2291_c7_632f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2291_c7_632f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2291_c7_632f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2291_c7_632f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2291_c7_632f]
signal result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2291_c7_632f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2291_c7_632f]
signal t8_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2294_c30_3a14]
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2299_c11_4592]
signal BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2299_c7_df5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2299_c7_df5a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2299_c7_df5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce
BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_left,
BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_right,
BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376
result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_cond,
result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output);

-- t8_MUX_uxn_opcodes_h_l2283_c2_e376
t8_MUX_uxn_opcodes_h_l2283_c2_e376 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2283_c2_e376_cond,
t8_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue,
t8_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse,
t8_MUX_uxn_opcodes_h_l2283_c2_e376_return_output);

-- printf_uxn_opcodes_h_l2284_c3_edda_uxn_opcodes_h_l2284_c3_edda
printf_uxn_opcodes_h_l2284_c3_edda_uxn_opcodes_h_l2284_c3_edda : entity work.printf_uxn_opcodes_h_l2284_c3_edda_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2284_c3_edda_uxn_opcodes_h_l2284_c3_edda_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_left,
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_right,
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143
result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_cond,
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output);

-- t8_MUX_uxn_opcodes_h_l2288_c7_6143
t8_MUX_uxn_opcodes_h_l2288_c7_6143 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2288_c7_6143_cond,
t8_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue,
t8_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse,
t8_MUX_uxn_opcodes_h_l2288_c7_6143_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037
BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_left,
BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_right,
BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f
result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f
result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f
result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f
result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output);

-- t8_MUX_uxn_opcodes_h_l2291_c7_632f
t8_MUX_uxn_opcodes_h_l2291_c7_632f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2291_c7_632f_cond,
t8_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue,
t8_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse,
t8_MUX_uxn_opcodes_h_l2291_c7_632f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14
sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_ins,
sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_x,
sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_y,
sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592
BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_left,
BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_right,
BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
 t8_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output,
 t8_MUX_uxn_opcodes_h_l2288_c7_6143_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output,
 t8_MUX_uxn_opcodes_h_l2291_c7_632f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_d061 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2284_c3_edda_uxn_opcodes_h_l2284_c3_edda_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2289_c3_0e85 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2296_c3_173e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2291_c7_632f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_911e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_fbba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_6b07_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_ca26_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2291_l2299_l2288_DUPLICATE_334d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2305_l2279_DUPLICATE_2e88_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2296_c3_173e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2296_c3_173e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2289_c3_0e85 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2289_c3_0e85;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_d061 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_d061;
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_ca26 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_ca26_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2291_c11_7037] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_left;
     BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output := BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_911e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_911e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2299_c11_4592] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_left;
     BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_return_output := BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2288_c11_2f50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_left;
     BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output := BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2291_c7_632f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2291_c7_632f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_fbba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_fbba_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2291_l2299_l2288_DUPLICATE_334d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2291_l2299_l2288_DUPLICATE_334d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_6b07 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_6b07_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2294_c30_3a14] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_ins;
     sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_x;
     sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_return_output := sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2283_c6_56ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c6_56ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_2f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_7037_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2299_c11_4592_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_ca26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_ca26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_ca26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2291_l2299_l2288_DUPLICATE_334d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2291_l2299_l2288_DUPLICATE_334d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2291_l2299_l2288_DUPLICATE_334d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_911e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_911e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_911e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_fbba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_fbba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2299_l2288_DUPLICATE_fbba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_6b07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_6b07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2291_l2283_l2288_DUPLICATE_6b07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2291_c7_632f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_3a14_return_output;
     -- t8_MUX[uxn_opcodes_h_l2291_c7_632f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2291_c7_632f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_cond;
     t8_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue;
     t8_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_return_output := t8_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2283_c1_db9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2291_c7_632f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2299_c7_df5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2291_c7_632f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2291_c7_632f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2299_c7_df5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2299_c7_df5a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2284_c3_edda_uxn_opcodes_h_l2284_c3_edda_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2283_c1_db9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2299_c7_df5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2291_c7_632f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2288_c7_6143] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;

     -- t8_MUX[uxn_opcodes_h_l2288_c7_6143] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2288_c7_6143_cond <= VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_cond;
     t8_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue;
     t8_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_return_output := t8_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2288_c7_6143] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2291_c7_632f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;

     -- printf_uxn_opcodes_h_l2284_c3_edda[uxn_opcodes_h_l2284_c3_edda] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2284_c3_edda_uxn_opcodes_h_l2284_c3_edda_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2284_c3_edda_uxn_opcodes_h_l2284_c3_edda_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2291_c7_632f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2288_c7_6143] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_return_output := result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_632f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c2_e376] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2283_c2_e376] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_return_output := result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2288_c7_6143] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c2_e376] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2288_c7_6143] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2288_c7_6143] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;

     -- t8_MUX[uxn_opcodes_h_l2283_c2_e376] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2283_c2_e376_cond <= VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_cond;
     t8_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue;
     t8_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_return_output := t8_MUX_uxn_opcodes_h_l2283_c2_e376_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_6143_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2283_c2_e376_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c2_e376] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2283_c2_e376] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2283_c2_e376] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2305_l2279_DUPLICATE_2e88 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2305_l2279_DUPLICATE_2e88_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c2_e376_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c2_e376_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2305_l2279_DUPLICATE_2e88_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2305_l2279_DUPLICATE_2e88_return_output;
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
