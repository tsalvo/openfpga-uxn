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
entity inc_0CLK_b7103d16 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc_0CLK_b7103d16;
architecture arch of inc_0CLK_b7103d16 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1262_c6_8984]
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1262_c1_2f04]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1262_c2_f901]
signal t8_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1262_c2_f901]
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c2_f901]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c2_f901]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c2_f901]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c2_f901]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c2_f901]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l1263_c3_f767[uxn_opcodes_h_l1263_c3_f767]
signal printf_uxn_opcodes_h_l1263_c3_f767_uxn_opcodes_h_l1263_c3_f767_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_a101]
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1267_c7_1373]
signal t8_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_1373]
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c7_1373]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_1373]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_1373]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_1373]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_1373]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_ac58]
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1270_c7_16e8]
signal t8_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_16e8]
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_16e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_16e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_16e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_16e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_16e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1273_c30_2e5f]
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1276_c21_cc7d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_48bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_5e1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_5e1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_5e1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_left,
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_right,
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_return_output);

-- t8_MUX_uxn_opcodes_h_l1262_c2_f901
t8_MUX_uxn_opcodes_h_l1262_c2_f901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1262_c2_f901_cond,
t8_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue,
t8_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse,
t8_MUX_uxn_opcodes_h_l1262_c2_f901_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_cond,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output);

-- printf_uxn_opcodes_h_l1263_c3_f767_uxn_opcodes_h_l1263_c3_f767
printf_uxn_opcodes_h_l1263_c3_f767_uxn_opcodes_h_l1263_c3_f767 : entity work.printf_uxn_opcodes_h_l1263_c3_f767_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1263_c3_f767_uxn_opcodes_h_l1263_c3_f767_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_left,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_right,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output);

-- t8_MUX_uxn_opcodes_h_l1267_c7_1373
t8_MUX_uxn_opcodes_h_l1267_c7_1373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1267_c7_1373_cond,
t8_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue,
t8_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse,
t8_MUX_uxn_opcodes_h_l1267_c7_1373_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_cond,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_left,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_right,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output);

-- t8_MUX_uxn_opcodes_h_l1270_c7_16e8
t8_MUX_uxn_opcodes_h_l1270_c7_16e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1270_c7_16e8_cond,
t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue,
t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse,
t8_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f
sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_ins,
sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_x,
sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_y,
sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_return_output,
 t8_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output,
 t8_MUX_uxn_opcodes_h_l1267_c7_1373_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output,
 t8_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output,
 sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_46ef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1263_c3_f767_uxn_opcodes_h_l1263_c3_f767_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_ce90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1276_c3_4d40 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_eba3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1270_c7_16e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_5955_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_c07f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_6431_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_9855_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1267_l1270_l1278_DUPLICATE_e24d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1258_l1284_DUPLICATE_017b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_46ef := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_46ef;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_ce90 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_ce90;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_eba3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_eba3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1270_c7_16e8] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1270_c7_16e8_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_c07f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_c07f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_9855 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_9855_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_ac58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_left;
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output := BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1262_c6_8984] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_left;
     BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output := BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_6431 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_6431_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_a101] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_left;
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output := BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_5955 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_5955_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1276_c21_cc7d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1273_c30_2e5f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_ins;
     sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_x;
     sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_return_output := sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_48bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1267_l1270_l1278_DUPLICATE_e24d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1267_l1270_l1278_DUPLICATE_e24d_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_8984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_a101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_ac58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_48bc_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1276_c3_4d40 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_cc7d_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_9855_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_9855_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_9855_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1267_l1270_l1278_DUPLICATE_e24d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1267_l1270_l1278_DUPLICATE_e24d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1267_l1270_l1278_DUPLICATE_e24d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_c07f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_c07f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_c07f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_6431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_6431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1267_l1262_l1278_DUPLICATE_6431_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_5955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_5955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_5955_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1270_c7_16e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_2e5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1276_c3_4d40;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_16e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_5e1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_5e1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_16e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1262_c1_2f04] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_5e1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_16e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1270_c7_16e8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1270_c7_16e8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_cond;
     t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue;
     t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output := t8_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l1263_c3_f767_uxn_opcodes_h_l1263_c3_f767_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_2f04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_5e1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;
     -- printf_uxn_opcodes_h_l1263_c3_f767[uxn_opcodes_h_l1263_c3_f767] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1263_c3_f767_uxn_opcodes_h_l1263_c3_f767_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1263_c3_f767_uxn_opcodes_h_l1263_c3_f767_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_1373] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_16e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_1373] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_return_output := result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;

     -- t8_MUX[uxn_opcodes_h_l1267_c7_1373] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1267_c7_1373_cond <= VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_cond;
     t8_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue;
     t8_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_return_output := t8_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_1373] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_16e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_16e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_16e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1262_c2_f901] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_return_output := result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c7_1373] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c2_f901] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_1373] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c2_f901] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_return_output;

     -- t8_MUX[uxn_opcodes_h_l1262_c2_f901] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1262_c2_f901_cond <= VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_cond;
     t8_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue;
     t8_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_return_output := t8_MUX_uxn_opcodes_h_l1262_c2_f901_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_1373] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_1373_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1262_c2_f901_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c2_f901] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c2_f901] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c2_f901] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1258_l1284_DUPLICATE_017b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1258_l1284_DUPLICATE_017b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_f901_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_f901_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1258_l1284_DUPLICATE_017b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1258_l1284_DUPLICATE_017b_return_output;
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
